import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:socio/helperfunction/helper_function.dart';
import 'package:socio/screens/current_user/model/post_model.dart';

import '../api/api_endpoints.dart';

class Post {
  Future<String?> uploadImage(
      PostDetails postDetails, PostImage Postimage) async {
    try {
      log("uplad image called");
      log("image :" + Postimage.image.path);
      String fileName = Postimage.image.path.split('/').last;
      String format = fileName.split('.').last;
      final dio = Dio();
      dio.options.contentType = 'multipart/form-data';
      dio.options.headers['Content-Type'] = 'multipart/form-data';
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(Postimage.image.path,
            filename: fileName, contentType: MediaType("image", format)),
        "userId": postDetails.userId,
        "caption": postDetails.caption
      });

      final authToken = await HelperFuction.getToken();
      final token = {"authtoken": authToken};

      log("called uploadImage function API");
      Response response = await Dio().post("${Api.baseUrl}/post",
          data: formData,
          options: Options(
            headers: token,
          ));
      if (response.statusCode! > 199 || response.statusCode! < 300) {
        log(response.toString());
        log(response.statusCode.toString());
        return "sucess";
      } else {
        log(response.statusCode.toString());
        log(response.data.toString());
        log(response.toString());
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      log("dio error message " + e.message.toString());
      if (e.message.startsWith("SocketException")) {
        return "please check your internet connection";
      }
      if (e.response?.data is Map && e.response!.data['error'] != null) {
        return e.response!.data['error'];
      }
      log("posting failed ${e.message}");
      return e.message;
    }
  }
}
