import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:socio/screens/signup/model_class/model.dart';
import 'package:socio/services/authentication.dart';
import 'package:socio/common/custom_snackbar.dart';
import '../view/otp.dart';

class SignupProvider with ChangeNotifier {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailConntroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool loadining = false;
  bool visibility = true;
  validation(context) {
    if (formKey.currentState!.validate()) {
      final user = User(
          username: userNameController.text.trim(),
          fullname: fullNameController.text.trim(),
          email: emailConntroller.text.trim(),
          password: passwordController.text.trim(),
          confirmpssword: confirmPasswordController.text.trim(),
          phoneNumber: numberController.text.trim());
      if (loadining != true) {
        log("Fuction called");
        loadining = true;
        notifyListeners();
        Auth().signupFunction(user).then((value) {
          loadining = false;
          notifyListeners();
          if (value == "sucess") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => OtpScreen(
                      user: user,
                    )));
          } else {
            loadining = false;
            notifyListeners();
            log("Something went wrong");
            customSnackBar(context, value!);
          }
        });
      }
    }
  }

  checkVisibility() {
    visibility = !visibility;
    notifyListeners();
  }
}
