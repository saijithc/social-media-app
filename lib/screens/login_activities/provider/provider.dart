import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:socio/screens/bottom/bottom.dart';
import 'package:socio/screens/login_activities/model/login_model.dart';
import 'package:socio/services/authentication.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  bool visibility = false;
  validation(context) {
    if (formKey.currentState!.validate()) {
      loading = true;
      notifyListeners();
      final user = LoginUser(
          email: emailController.text.trim(),
          passWord: passwordController.text.trim());
      Auth().signmIn(user, context).then((value) {
        loading = false;
        notifyListeners();
        if (value) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => const Bottom()));
          emailController.clear();
          passwordController.clear();
        } else {
          log("something went wrong");
        }
      });
    }
  }

  checkVisibility() {
    visibility = !visibility;
    notifyListeners();
  }
}
