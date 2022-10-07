import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:socio/api/api_endpoints.dart';

import '../helperfunction/helper_function.dart';

class ReportApi {
  reportPost(postId) async {
    try {
      final id = await HelperFuction.getUserid();
      final authToken = await HelperFuction.getToken();
      final token = {"AuthToken": authToken};
      Response response = await Dio().post(
          "${Api.baseUrl}/post/reportPost/${postId}",
          data: id,
          options: Options(headers: token));
      if (response.statusCode! > 199 || response.statusCode! < 300) {
        log(response.data);
        log(response.statusMessage.toString());
        log(response.statusCode!.toString());
      } else {
        log(response.statusCode!.toString());
      }
    } catch (e) {
      if (e is DioError) {
        log(e.message);
        log(e.type.toString());
      }
      log(e.toString());
    }
  }
}
