import 'dart:convert';

GetCurrentUserPostModel getCurrentUserPostModelFromJson(String str) =>
    GetCurrentUserPostModel.fromJson(json.decode(str));

String getCurrentUserPostModelToJson(GetCurrentUserPostModel data) =>
    json.encode(data.toJson());

class GetCurrentUserPostModel {
  GetCurrentUserPostModel({
    required this.userDetails,
  });

  final UserDetails userDetails;

  factory GetCurrentUserPostModel.fromJson(Map<String, dynamic> json) =>
      GetCurrentUserPostModel(
        userDetails: UserDetails.fromJson(json["userDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "userDetails": userDetails.toJson(),
      };
}

class UserDetails {
  UserDetails({
    required this.id,
    required this.username,
    required this.fullname,
    required this.email,
    required this.phoneNumber,
    required this.avatar,
    required this.bio,
    required this.posts,
    required this.followers,
    required this.saved,
    required this.following,
    required this.private,
    required this.blocked,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String username;
  final String fullname;
  final String email;
  final dynamic phoneNumber;
  final String avatar;
  final String bio;
  final List<Post> posts;
  final List<dynamic> followers;
  final List<dynamic> saved;
  final List<String> following;
  final bool private;
  final bool blocked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["_id"],
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        avatar: json["avatar"],
        bio: json["bio"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        saved: List<dynamic>.from(json["saved"].map((x) => x)),
        following: List<String>.from(json["following"].map((x) => x)),
        private: json["private"],
        blocked: json["blocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "fullname": fullname,
        "email": email,
        "phoneNumber": phoneNumber,
        "avatar": avatar,
        "bio": bio,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "saved": List<dynamic>.from(saved.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x)),
        "private": private,
        "blocked": blocked,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Post {
  Post({
    required this.id,
    required this.userId,
    required this.image,
    required this.caption,
    required this.hashtags,
    required this.likes,
    required this.savedBy,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String userId;
  final String image;
  final String caption;
  final List<dynamic> hashtags;
  final List<dynamic> likes;
  final List<dynamic> savedBy;
  final List<dynamic> comments;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        userId: json["userId"],
        image: json["image"],
        caption: json["caption"],
        hashtags: List<dynamic>.from(json["hashtags"].map((x) => x)),
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        savedBy: List<dynamic>.from(json["savedBy"].map((x) => x)),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "image": image,
        "caption": caption,
        "hashtags": List<dynamic>.from(hashtags.map((x) => x)),
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "savedBy": List<dynamic>.from(savedBy.map((x) => x)),
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
