import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:socio/api/api_endpoints.dart';
import 'package:socio/helperfunction/helper_function.dart';

class Suggestion {
  Future<List> getSuggestions() async {
    try {
      final id = await HelperFuction.getUserid();
      final authToken = await HelperFuction.getToken();
      final token = {"AuthToken": authToken};
      Response response = await Dio().get(
          "${Api.baseUrl}/user/suggestion/${id}",
          options: Options(headers: token));
      if (response.statusCode! > 199 || response.statusCode! < 300) {
        log(response.data.toString());
        log(response.statusCode.toString());
        return response.data;
      } else {
        log(response.statusCode!.toString());
        log(response.data.toString());
      }
    } catch (e) {
      if (e is DioError) {
        log(e.message);
        log(e.type.toString());
      }
      log(e.toString());
    }
    return [];
  }
}
