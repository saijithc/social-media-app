import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:socio/api/api_endpoints.dart';
import 'package:socio/helperfunction/helper_function.dart';
import 'package:socio/screens/current_user/model/current_user_details.dart';

class CurrentUserDetails {
  Future<GetCurrentUserPostModel?> getUserDetails() async {
    try {
      log("CurrentUserDetails");
      final id = await HelperFuction.getUserid();
      Response response = await Dio().get("${Api.baseUrl}/user/${id}");
      if (response.statusCode! > 199 || response.statusCode! < 300) {
        log("sucess ++");
        //log(response.data.toString());
        // log(response.statusCode.toString());
        return GetCurrentUserPostModel.fromJson(response.data);
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      if (e is DioError) {
        log(e.message);
        log(e.type.toString());
      }
    }
    return null;
  }
}
