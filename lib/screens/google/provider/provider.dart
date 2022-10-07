import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socio/screens/google/model/model.dart';
import 'package:socio/services/authentication.dart';
import 'package:socio/widgets/custom_snackbar.dart';
import '../../bottom/view/bottom.dart';

class GoogleProvider with ChangeNotifier {
  signIn(context, int count) {
    try {
      log("function called");
      GoogleSignInApi.login().then((value) {
        log("after login");
        if (value != null) {
          final account = GoogleAccount(
              email: value.email,
              passWord: value.id,
              fullname: value.displayName!);
          log(account.toString());
          if (count == 1) {
            Auth().googleSignup(account).then((value) {
              if (value == "SUCESS") {
                // customSnackBar(context, "SUCESS");
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => const Bottom()));
              } else {
                customSnackBar(context, value.toString());
                log("something went wrong");
              }
            });
          } else {
            final account = GoogleLogin(
              email: value.email,
              passWord: value.id,
            );
            Auth().signIn(account).then((value) {
              if (value == "sucess") {
                customSnackBar(context, value!);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => const Bottom()));
              } else {
                customSnackBar(context, value.toString());
                log("something went wrong");
              }
            });
          }
        }
      });
    } catch (e) {
      customSnackBar(context, e.toString());
      log(e.toString());
    }
  }
}

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );
  static Future<GoogleSignInAccount?> login() async {
    try {
      log('hei sai');
      final credential = await _googleSignIn.signIn();
      log(credential!.email.toString());
      log(credential.displayName!);
      return credential;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static logout() {
    _googleSignIn.signOut();
  }
}
