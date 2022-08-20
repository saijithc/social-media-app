import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(
  String hintText,
) {
  return InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      // focusedBorder: InputBorder.,
      // focusColor: Colors.black,
      fillColor: Colors.black.withOpacity(0.1),
      filled: true,
      hintText: hintText,
      hintStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
}

TextStyle simpleTextFieldStyle(colors) {
  return TextStyle(color: colors);
}


// InputDecoration(
//       focusedBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.white)),
//       hintText: hintText,
//       hintStyle: const TextStyle(color: Colors.white));