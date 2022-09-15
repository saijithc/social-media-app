import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:socio/screens/google/model/model.dart';
import 'package:socio/screens/login_activities/view/widget/sucess.dart';
import 'package:socio/widgets/custom_snackbar.dart';
import '../helperfunction/helper_function.dart';
import '../screens/login_activities/model/login_model.dart';
import '../screens/signup/model_class/model.dart';

class Auth {
  Future<bool> signupFunction(User user, BuildContext context) async {
    try {
      Response response = await Dio().post(
          "https://tailus-api.herokuapp.com/api/v1/auth/signup",
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
      if (e.message.startsWith("SocketException")) {
        log("please check internet");
        customSnackBar(context, "please check your internet connection");
        return false;
      }
      log("Account creation Failed${e.toString()}");
      customSnackBar(context, e.response!.data['error']);
    }
    return false;
  }

  Future<bool> signIn(LoginUser user, BuildContext context) async {
    try {
      Response response = await Dio().post(
          "https://tailus-api.herokuapp.com/api/v1/auth/signin",
          data: user.toJson());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        HelperFuction.saveUserLogged(true);
        log(response.toString());
        log(user.toString());
        return true;
      } else {
        log(response.statusCode.toString());
        log(response.data.toString());
        log(response.toString());
        log(user.toString());
      }
    } on DioError catch (e) {
      if (e.message.startsWith("SocketException")) {
        log("please check internet");
        customSnackBar(context, "please check your internet connection");
        return false;
      }

      log("Login failed ${e.response!.data['error']}");
      customSnackBar(context, e.response!.data['error']);
    }
    return false;
  }

  Future<bool> otpVerificatioin(context, User user, String otp) async {
    try {
      Map data = user.tojson();
      data["Otp"] = otp;
      Response response = await Dio().post(
          "https://tailus-api.herokuapp.com/api/v1/auth/verifyOtp",
          data: data);
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(response.data.toString());
        return true;
      } else {
        log("Otp failed");
        log(response.data.toString());
        log(response.statusCode.toString());
      }
    } on DioError catch (e) {
      if (e.message.startsWith("SocketException")) {
        log("please check internet");
        customSnackBar(context, "please check your internet connection");
        return false;
      }
      customSnackBar(context, e.response!.data['error']);
    }
    return false;
  }

  Future<bool> googleSignup(GoogleAccount account) async {
    try {
      Response response = await Dio().post(
          "https://tailus-api.herokuapp.com/api/v1/auth/googleSignup",
          data: account.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        HelperFuction.saveUserLogged(true);
        log(response.toString());
        log(response.data.toString());
        return true;
      }
      log(response.statusCode.toString());
    } on DioError catch (e) {
      log(e.response!.data['error']);
    }
    return false;
  }

  Future<bool> forgotPassword(String email, context) async {
    try {
      Response response = await Dio().post(
          "https://tailus-api.herokuapp.com/api/v1/auth/forgotPassword",
          data: {'email': email});
      sucess(context, response.data['error']);
      log(response.toString());
      log(response.data.toString());
      return true;
    } on DioError catch (e) {
      if (e.message.startsWith("SocketException")) {
        log("please check internet");
        customSnackBar(context, "please check your internet connection");
        return false;
      }
      log(e.response!.data['error']);
      customSnackBar(context, e.response!.data['error']);
    }
    return false;
  }
}
