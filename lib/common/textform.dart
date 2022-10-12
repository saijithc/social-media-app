import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(String hintText, {IconButton? icon}) {
  return InputDecoration(
    suffixIcon: icon,
    contentPadding: const EdgeInsets.all(10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    fillColor: Colors.black.withOpacity(0.1),
    filled: true,
    labelText: hintText,
    labelStyle:
        const TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
  );
}

TextStyle simpleTextFieldStyle(colors) {
  return TextStyle(color: colors);
}
