import 'package:flutter/material.dart';
import 'package:socio/Screens/Bottom/bottom.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  validation(context) {
    if (formKey.currentState!.validate()) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const Bottom()));
      passwordController.clear();
      numberController.clear();
    }
  }
}
