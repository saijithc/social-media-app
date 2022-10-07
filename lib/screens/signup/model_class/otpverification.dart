import 'dart:convert';

OtpVerification otpVerificationFromJson(String str) =>
    OtpVerification.fromJson(json.decode(str));

String otpVerificationToJson(OtpVerification data) =>
    json.encode(data.toJson());

class OtpVerification {
  OtpVerification({
    required this.status,
    required this.message,
    required this.token,
    required this.refreshToken,
    required this.userDetails,
  });

  final bool status;
  final String message;
  final String token;
  final String refreshToken;
  final UserDetails userDetails;

  factory OtpVerification.fromJson(Map<String, dynamic> json) =>
      OtpVerification(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        refreshToken: json["refreshToken"],
        userDetails: UserDetails.fromJson(json["userDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "refreshToken": refreshToken,
        "userDetails": userDetails.toJson(),
      };
}

class UserDetails {
  UserDetails({
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
    required this.refreshToken,
    required this.private,
    required this.blocked,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String username;
  final String fullname;
  final String email;
  final int phoneNumber;
  final String avatar;
  final String bio;
  final List<dynamic> posts;
  final List<dynamic> followers;
  final List<dynamic> saved;
  final List<dynamic> following;
  final dynamic refreshToken;
  final bool private;
  final bool blocked;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        avatar: json["avatar"],
        bio: json["bio"],
        posts: List<dynamic>.from(json["posts"].map((x) => x)),
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        saved: List<dynamic>.from(json["saved"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
        refreshToken: json["refreshToken"],
        private: json["private"],
        blocked: json["blocked"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "fullname": fullname,
        "email": email,
        "phoneNumber": phoneNumber,
        "avatar": avatar,
        "bio": bio,
        "posts": List<dynamic>.from(posts.map((x) => x)),
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "saved": List<dynamic>.from(saved.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x)),
        "refreshToken": refreshToken,
        "private": private,
        "blocked": blocked,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
