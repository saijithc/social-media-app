import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:socio/api/api_endpoints.dart';
import 'package:socio/helperfunction/helper_function.dart';

class DeletePostApi {
  Future<String?> deletePost(postId) async {
    try {
      final id = await HelperFuction.getUserid();
      final userId = {"userId": id};
      final authToken = await HelperFuction.getToken();
      final token = {"AuthToken": authToken};
      Response response = await Dio().delete("${Api.baseUrl}/post/${postId}",
          data: userId, options: Options(headers: token));
      if (response.statusCode! > 199 || response.statusCode! < 300) {
        log(response.data.toString());
        log(response.statusCode.toString());
        return "sucess";
      } else {
        log(response.data.toString());
        log(response.statusCode.toString());
        return response.data;
      }
    } catch (e) {
      if (e is DioError) {
        log(e.message);
      } else {
        log(e.toString());
      }
    }
    return null;
  }
}
