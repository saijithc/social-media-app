import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:socio/helperfunction/helper_function.dart';
import 'package:socio/screens/bottom/bottom.dart';
import 'package:socio/screens/signup/model_class/model.dart';

class OtpProvider with ChangeNotifier {
  bool loadining = false;
  final TextEditingController textEditingController = TextEditingController();
  verification(context, User user, String otp) async {
    loadining = true;
    notifyListeners();
    try {
      Map data = user.tojson();
      // data.addEntries({MapEntry<String, String>("Otp", otp)});
      data["Otp"] = otp;
      Response response = await Dio().post(
          "https://tailus-api-gateway.herokuapp.com/api/v1/auth/verifyOtp",
          data: data);
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   behavior: SnackBarBehavior.floating,
        //   margin: const EdgeInsets.all(20),
        //   padding: const EdgeInsets.all(15),
        //   content: text1("Account created successfully"),
        //   duration: const Duration(seconds: 2),
        // ));
        log(response.data);
        log("Otp sucess");
        HelperFuction.saveUserLogged(true);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const Bottom()));
      } else {
        log("Otp failed");
        log(response.data.toString());
        log(response.statusCode.toString());
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   behavior: SnackBarBehavior.floating,
        //   margin: const EdgeInsets.all(20),
        //   padding: const EdgeInsets.all(15),
        //   content: text1("Something went wrong "),
        //   duration: const Duration(seconds: 2),
        // ));
      }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        content: Text(e.response!.data['error']),
        duration: const Duration(seconds: 2),
      ));
      //print("Otp verification Failed${e.toString()}");
    }
    return false;
  }
}
