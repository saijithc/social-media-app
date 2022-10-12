import 'package:flutter/material.dart';

customSnackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(15),
    content: Text(message),
    duration: const Duration(seconds: 3),
  ));
}
