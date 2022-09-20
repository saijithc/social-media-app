import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:socio/helperfunction/helper_function.dart';
import 'package:socio/screens/current_user/model/post_model.dart';

class Post {
  Future<String?> uploadImage(
      PostDetails postDetails, PostImage Postimage) async {
    try {
      log("uplad image called");
      log("image :" + Postimage.image.path.split('/').last);
      var formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(Postimage.image.path,
            filename: Postimage.image.path.split('/').last),
        "userId": postDetails.userId,
        "caption": postDetails.caption
      });

      final token = {"authtoken": await HelperFuction.getToken()};

      log("called uploadImage function API");
      Response response = await Dio().post(
          "https://tailus-api.herokuapp.com/api/v1/post",
          data: formData,
          options: Options(headers: token, contentType: "multipart/form-data"));
      if (response.statusCode! > 199 || response.statusCode! < 300) {
        log(response.toString());
        log(response.statusCode.toString());

        return "sucess";
      } else {
        log(response.statusCode.toString());
        log(response.data.toString());
        log(response.toString());
      }
    } on DioError catch (e) {
      log("dio error message " + e.message.toString());
      if (e.message.startsWith("SocketException")) {
        return "please check your internet connection";
      }
      log("posting failed ${e.message}");
      return e.message;
    }
    return "error 2";
  }
}
