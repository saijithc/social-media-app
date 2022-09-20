import 'dart:io';

class PostDetails {
  String? caption;
  String userId = '';

  PostDetails({required this.caption, required this.userId});
  Map<dynamic, dynamic> tojson() {
    return {
      "caption": caption ?? '',
      "userId": userId,
    };
  }
}

class PostImage {
  File image;
  PostImage({required this.image});
  Map<dynamic, dynamic> tojson() {
    return {"image": image};
  }
}
