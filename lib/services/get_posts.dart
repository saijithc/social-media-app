import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:socio/api/api_endpoints.dart';
import 'package:socio/helperfunction/helper_function.dart';
import 'package:socio/screens/current_user/model/timeline_post_model.dart';

class GetPosts {
  Future<List<GetPostModel>?> GetTimelinePosts() async {
    try {
      final id = await HelperFuction.getUserid();
      final authToken = await HelperFuction.getToken();
      final token = {"AuthToken": authToken};
      log("this is my auth token" + token.toString());
      Response response = await Dio().get("${Api.baseUrl}/post/timeline/${id}",
          options: Options(headers: token));
      if (response.statusCode! > 199 || response.statusCode! < 300) {
        log(response.statusCode.toString());
        log("datas = " + response.data.toString());
        //log("parsed data =" + getPostModelFromJson(response.data).toString());
        return getPostModelFromJson(response.data);
      }
      log(response.data);
      log(response.statusCode.toString());
    } catch (e) {
      if (e is DioError) {
        log(e.message);
      } else {
        log(e.toString());
      }

      return null;
    }
    return null;
  }
}
