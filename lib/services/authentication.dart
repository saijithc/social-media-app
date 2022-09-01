import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../helperfunction/helper_function.dart';
import '../screens/login_activities/model/login_model.dart';
import '../screens/signup/model_class/model.dart';

class Auth {
  Future<bool> signupFunction(User user, BuildContext context) async {
    try {
      Response response = await Dio().post(
          "https://tailus-api-gateway.herokuapp.com/api/v1/auth/signup",
          data: user.tojson());

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log("hey..........");
        log(response.toString());
        log(user.toString());
        return true;
        // // passwordController.clear();
        // numberController.clear();
        // confirmPasswordController.clear();
        // fullNameController.clear();
        // userNameController.clear();
        // emailConntroller.clear();
      } else {
        log(response.statusCode.toString());
        log(response.data.toString());
        log(response.toString());
        log(user.toString());
      }
    } on DioError catch (e) {
      log("Account creation Failed${e.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        content: Text(e.response!.data['error']),
        duration: const Duration(seconds: 2),
      ));
    }
    return false;
  }

  Future<bool> signmIn(LoginUser user, BuildContext context) async {
    try {
      Response response = await Dio().post(
          "https://tailus-api-gateway.herokuapp.com/api/v1/auth/signin",
          data: user.toJson());

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        HelperFuction.saveUserLogged(true);
        log(response.toString());
        log(user.toString());
        return true;
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (ctx) => const Bottom()));
      } else {
        log(response.statusCode.toString());
        log(response.data.toString());
        log(response.toString());
        log(user.toString());
      }
    } on DioError catch (e) {
      log("Login failed ${e.response!.data['error']}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        content: Text(e.response!.data['error']),
        duration: const Duration(seconds: 2),
      ));
    }
    return false;
  }
}
