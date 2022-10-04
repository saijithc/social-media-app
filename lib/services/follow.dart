import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:socio/api/api_endpoints.dart';

import '../helperfunction/helper_function.dart';

class FollowAndUnfollow {
  followAndUnfollow(id) async {
    try {
      final id = await HelperFuction.getUserid();
      final userId = {"userId": id};
      final authToken = await HelperFuction.getToken();
      final token = {"AuthToken": authToken};
      Response response = await Dio().put("${Api.baseUrl}/user/follow/${id}",
          data: userId, options: Options(headers: token));
      if (response.statusCode! > 199 || response.statusCode! < 300) {
        log(response.data);
        log(response.statusCode!.toString());
      } else {
        log(response.data);
        log(response.statusCode!.toString());
      }
    } catch (e) {
      if (e is DioError) {
        log(e.message);
      } else {
        log(e.toString());
      }
    }
  }
}
