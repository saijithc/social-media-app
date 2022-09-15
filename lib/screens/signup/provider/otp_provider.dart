import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:socio/helperfunction/helper_function.dart';
import 'package:socio/screens/bottom/bottom.dart';
import 'package:socio/screens/signup/model_class/model.dart';
import 'package:socio/services/authentication.dart';

class OtpProvider with ChangeNotifier {
  bool loadining = false;
  final TextEditingController textEditingController = TextEditingController();
  verification(context, User user, String otp) async {
    if (loadining != true) {
      log("Otp message");
      loadining = true;
      notifyListeners();
      Auth().otpVerificatioin(context, user, otp).then((value) {
        if (value) {
          HelperFuction.saveUserLogged(true);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => const Bottom()));
        }
      });
    }

    // try {
    //   Map data = user.tojson();
    //   data["Otp"] = otp;
    //   Response response = await Dio().post(
    //       "https://tailus-api-gateway.herokuapp.com/api/v1/auth/verifyOtp",
    //       data: data);
    //   if (response.statusCode! >= 200 || response.statusCode! <= 299) {
    //     log(response.data.toString());
    //     HelperFuction.saveUserLogged(true);
    //     Navigator.of(context)
    //         .push(MaterialPageRoute(builder: (ctx) => const Bottom()));
    //   } else {
    //     log("Otp failed");
    //     log(response.data.toString());
    //     log(response.statusCode.toString());
    //   }
    // } on DioError catch (e) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     behavior: SnackBarBehavior.floating,
    //     margin: const EdgeInsets.all(20),
    //     padding: const EdgeInsets.all(15),
    //     content: Text(e.response!.data['error']),
    //     duration: const Duration(seconds: 2),
    //   ));
    // }
    return false;
  }
}
