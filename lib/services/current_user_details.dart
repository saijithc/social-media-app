import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:socio/api/api_endpoints.dart';
import 'package:socio/screens/current_user/model/current_user_details.dart';

class CurrentUserDetails {
  Future<UserDetails?> getUserDetails(id) async {
    try {
      log("CurrentUserDetails");
      //  final id = await HelperFuction.getUserid();
      log("this is my Id =" + id.toString());
      Response response = await Dio().get("${Api.baseUrl}/user/${id}");
      if (response.statusCode! > 199 || response.statusCode! < 300) {
        log("sucess ++");
        log("response =" + response.data.toString());
        // log("why " +
        //     GetCurrentUserPostModel.fromJson(response.data).toString());
        final details = GetCurrentUserPostModel.fromJson(response.data);
        log("return details =" + details.toString());
        return details.userDetails;
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
