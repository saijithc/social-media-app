import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:socio/screens/bottom/bottom.dart';
import 'package:socio/screens/login_activities/model/login_model.dart';
import 'package:socio/services/authentication.dart';
import 'package:socio/widgets/custom_snackbar.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController forgotEmailController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final forgotkey = GlobalKey<FormState>();
  bool loading = false;
  bool progress = false;
  bool visibility = true;
  validation(context) {
    if (formKey.currentState!.validate()) {
      // loading = true;

      final user = LoginUser(
          email: emailController.text.trim(),
          passWord: passwordController.text.trim());
      if (loading != true) {
        loading = true;
        notifyListeners();
        log("function called");
        Auth().signIn(user).then((value) {
          loading = false;
          notifyListeners();
          if (value == "sucess") {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const Bottom()));

            emailController.clear();
            passwordController.clear();
          } else {
            loading = false;
            notifyListeners();
            customSnackBar(context, value!);
            log("something went wrong");
          }
        });
      }
    }
  }

  checkVisibility() {
    visibility = !visibility;
    notifyListeners();
  }

  forgot(context) {
    if (forgotkey.currentState!.validate()) {
      progress = true;
      notifyListeners();
      Auth()
          .forgotPassword(forgotEmailController.text.trim(), context)
          .then((value) {
        progress = false;
        notifyListeners();
      });
    }
  }
}
