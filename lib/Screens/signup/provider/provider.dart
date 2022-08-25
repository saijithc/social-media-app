import 'package:flutter/material.dart';
import 'package:socio/Screens/Bottom/bottom.dart';
import 'package:socio/Screens/signup/view/otp.dart';

class SignupProvider with ChangeNotifier {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailConntroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  validation(context) {
    if (formKey.currentState!.validate()) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => OtpScreen()));
      passwordController.clear();
      numberController.clear();
      confirmPasswordController.clear();
      fullNameController.clear();
      userNameController.clear();
      emailConntroller.clear();
    }
  }
}
