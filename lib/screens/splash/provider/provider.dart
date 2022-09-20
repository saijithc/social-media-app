import 'dart:async';
import 'package:flutter/material.dart';
import 'package:socio/helperfunction/helper_function.dart';
import '../../bottom/bottom.dart';
import '../../login_activities/view/login.dart';

class SplashProvider with ChangeNotifier {
  Future gotoHome(BuildContext context, isLogged) async {
    final token = await HelperFuction.getToken();
    // log("token called" + token);
    if (HelperFuction.value == 2) {
      Timer(
          const Duration(seconds: 4),
          () => Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(
                      builder: (ctx) =>
                          token != null ? const Bottom() : const Login()))
                  .then((value) {
                HelperFuction.value = 0;
              }));
    }
  }
}
