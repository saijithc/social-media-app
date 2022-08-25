import 'package:flutter/material.dart';
import 'package:socio/Screens/Bottom/bottom.dart';

class OtpProvider with ChangeNotifier {
  final TextEditingController textEditingController = TextEditingController();
  verification(context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => const Bottom()));
  }
}
