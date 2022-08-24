import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    // focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(30),
    //     borderSide: BorderSide(color: Colors.black)),
    // focusedBorder: InputBorder.,
    // focusColor: Colors.black,
    fillColor: Colors.black.withOpacity(0.1),
    filled: true,
    labelText: hintText,
    // hintText: hintText,
    labelStyle:
        const TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
  );
}

TextStyle simpleTextFieldStyle(colors) {
  return TextStyle(color: colors);
}


// InputDecoration(
//       focusedBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.white)),
//       hintText: hintText,
//       hintStyle: const TextStyle(color: Colors.white));