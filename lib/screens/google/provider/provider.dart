import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socio/screens/google/model/model.dart';
import 'package:socio/services/authentication.dart';
import 'package:socio/widgets/custom_snackbar.dart';
import '../../bottom/bottom.dart';

class GoogleProvider with ChangeNotifier {
  Future signIn(context) async {
    try {
      log("function called");
      // final googleUser = await GoogleSignIn().signIn();
      // log('after calling signin');
      // if (googleUser == null) return;
      // final googleAuth = await googleUser.authentication;
      // log('saijith' + googleAuth.idToken.toString());
      await GoogleSignInApi.login()?.then((value) {
        log("after login");
        if (value != null) {
          final account = GoogleAccount(
              email: value.email.trim(),
              passWord: value.id,
              fullname: value.displayName!);
          Auth().googleSignup(account).then((value) {
            //loading = false;
            notifyListeners();
            if (value) {
              customSnackBar(context, "SUCESS");
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => const Bottom()));
            } else {
              customSnackBar(context, "something went wrong");
              log("something went wrong");
            }
          });
        }
      });
    } catch (e) {
      customSnackBar(context, e.toString());
      log(e.toString());
    }
  }
}

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?>? login() {
    try {
      log('hei sai');
      return _googleSignIn.signIn().then((value) {
        log('signin working');
        log(value!.email.toString());
      });
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
