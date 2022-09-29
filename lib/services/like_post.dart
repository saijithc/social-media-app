import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:socio/api/api_endpoints.dart';

import '../helperfunction/helper_function.dart';

class LikePost {
  Future<String?> likePost(postId) async {
    try {
      final id = await HelperFuction.getUserid();
      final authToken = await HelperFuction.getToken();
      final token = {"authtoken": authToken};
      Response response = await Dio().put("${Api.baseUrl}/post/like/${postId}",
          data: {"userId": id}, options: Options(headers: token));
      if (response.statusCode! > 199 || response.statusCode! < 300) {
        log(response.data);
        return response.data;
      }
    } catch (e) {
      if (e is DioError) {
        log(e.message);
      }
      log(e.toString());
    }
  }
}
