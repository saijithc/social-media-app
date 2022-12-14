import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:socio/api/api_endpoints.dart';
import 'package:socio/screens/current_user/model/user.dart';
import 'package:socio/screens/google/model/model.dart';
import 'package:socio/screens/login_activities/model/login_model.dart';
import 'package:socio/screens/login_activities/view/widget/sucess.dart';
import 'package:socio/screens/signup/model_class/otpverification.dart';
import 'package:socio/common/custom_snackbar.dart';
import '../helperfunction/helper_function.dart';
import '../screens/signup/model_class/model.dart';

class Auth {
  Future<String?> signupFunction(User user) async {
    try {
      Response response =
          await Dio().post("${Api.baseUrl}/auth/signup", data: user.tojson());
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
        return "please check your internet connection";
      }
      if (e.response?.data is Map && e.response!.data['error'] != null) {
        return e.response!.data['error'];
      }
      log("Account creation Failed${e.toString()}");
      return 'something went wrong';
    }
    return 'error2';
  }

  Future<String?> signIn(user) async {
    try {
      Response response =
          await Dio().post("${Api.baseUrl}/auth/signin", data: user.toJson());
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log(response.toString());
        final details = LoginUserDetails.fromJson(response.data);
        HelperFuction.saveUser(details.userDetails.id, details.token);
        CurrentUser.userId = await HelperFuction.getUserid();
        log(user.toString());
        return "sucess";
      } else {
        log(response.statusCode.toString());
        log(response.data.toString());
        log(response.toString());
        log(user.toString());
      }
    } on DioError catch (e) {
      log(e.response!.data.toString());
      if (e.message.startsWith("SocketException")) {
        return "please check your internet connection";
      }
      if (e.response?.data is Map && e.response!.data['error'] != null) {
        return e.response!.data['error'];
      }
      return 'something went wrong';
    }
    return "error 2";
  }

  Future<String?> otpVerificatioin(User user, String otp) async {
    try {
      Map data = user.tojson();
      data["Otp"] = otp;
      Response response =
          await Dio().post("${Api.baseUrl}/auth/verifyOtp", data: data);
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log('sucess');
        log(response.data.toString());
        final details = OtpVerification.fromJson(response.data);
        HelperFuction.saveUser(details.userDetails.id, details.token);
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
      Response response = await Dio()
          .post("${Api.baseUrl}/auth/googleSignup", data: account.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        HelperFuction.saveUserLogged(true);
        //HelperFuction.saveToken(response.data["token"]);
        HelperFuction.saveUser(response.data["id"], response.data["token"]);
        CurrentUser.userId = await HelperFuction.getUserid();
        log(response.toString());
        log("google response" + response.data.toString());
        return "SUCESS";
      }
      log(response.statusCode.toString());
    } on DioError catch (e) {
      if (e.message.startsWith("SocketException")) {
        return "please check your internet connection";
      }
      if (e.response?.data is Map && e.response!.data['error'] != null) {
        return e.response!.data['error'];
      }
      return 'something went wrong';
    }
    return 'error2';
  }

  Future<bool> forgotPassword(String email, context) async {
    try {
      Response response = await Dio()
          .post("${Api.baseUrl}/auth/forgotPassword", data: {'email': email});
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
