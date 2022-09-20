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
  Future<String?> signupFunction(User user) async {
    try {
      Response response = await Dio().post(
          "https://tailus-api.herokuapp.com/api/v1/auth/signup",
          data: user.tojson());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log("hey..........");
        log(response.toString());
        log(user.toString());
        return "sucess";
      } else {
        log(response.statusCode.toString());
        log(response.data.toString());
        log(response.toString());
        log(user.toString());
      }
    } on DioError catch (e) {
      if (e.message.startsWith("SocketException")) {
        log("please check internet");
        //customSnackBar(context, "please check your internet connection");
        return "please check your internet connection";
      }
      log("Account creation Failed${e.toString()}");
      //customSnackBar(context, e.response!.data['error']);
      return e.response!.data['error'];
    }
    return 'error2';
  }

  Future<String?> signIn(user) async {
    try {
      Response response = await Dio().post(
          "https://tailus-api.herokuapp.com/api/v1/auth/signin",
          data: user.toJson());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        //  HelperFuction.saveToken(response.data["token"]);
        HelperFuction.saveUser(response.data["id"], response.data["token"]);
        log(response.toString());
        log(user.toString());
        return "sucess";
      } else {
        log(response.statusCode.toString());
        log(response.data.toString());
        log(response.toString());
        log(user.toString());
      }
    } on DioError catch (e) {
      if (e.message.startsWith("SocketException")) {
        return "please check your internet connection";
      }
      log("Login failed ${e.response!.data['error']}");
      return e.response!.data['error'];
    }
    return "error 2";
  }

  Future<String?> otpVerificatioin(User user, String otp) async {
    try {
      Map data = user.tojson();
      data["Otp"] = otp;
      Response response = await Dio().post(
          "https://tailus-api.herokuapp.com/api/v1/auth/verifyOtp",
          data: data);
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(' sucess');
        log(response.data.toString());
        //perFuction.saveToken(response.data["token"]);
        await HelperFuction.saveUser(
            response.data["id"], response.data["token"]);

        log(response.statusMessage.toString());
        log('otp verification sucessfull');
        return "sucess";
      } else {
        log("Otp failed");
        log(response.data.toString());
        log(response.statusCode.toString());
      }
    } on DioError catch (e) {
      if (e.message.startsWith("SocketException")) {
        log("please check internet");
        return "please check your internet connection";
      }
      return e.response!.data['error'];
    }
    return "error2";
  }

  Future<String?> googleSignup(GoogleAccount account) async {
    try {
      Response response = await Dio().post(
          "https://tailus-api.herokuapp.com/api/v1/auth/googleSignup",
          data: account.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        HelperFuction.saveUserLogged(true);
        //HelperFuction.saveToken(response.data["token"]);
        HelperFuction.saveUser(response.data["id"], response.data["token"]);
        log(response.toString());
        log(response.data.toString());
        return "SUCESS";
      }
      log(response.statusCode.toString());
    } on DioError catch (e) {
      log(e.response!.data['error']);
      return e.response!.data['error'];
    }
    return 'error2';
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
