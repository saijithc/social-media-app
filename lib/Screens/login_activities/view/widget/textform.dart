import 'package:flutter/material.dart';
import 'package:socio/Widgets/textform.dart';

class Textform extends StatelessWidget {
  const Textform(
      {Key? key,
      required this.hint,
      required this.controller,
      this.validator,
      required this.obscureText,
      this.type})
      : super(key: key);
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? type;
  final String? hint;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        textInputAction: TextInputAction.next,
        keyboardType: type,
        validator: validator,
        controller: controller,
        style: simpleTextFieldStyle(Colors.black),
        decoration: textFieldInputDecoration(hint!));
  }
}
