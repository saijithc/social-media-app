import 'dart:convert';

class LoginUser {
  String email = '';
  String passWord = '';
  LoginUser({required this.email, required this.passWord});
  Map<String, String> toJson() {
    return {"email": email, "password": passWord};
  }
}

LoginUserDetails loginUserDetailsFromJson(String str) =>
    LoginUserDetails.fromJson(json.decode(str));

String loginUserDetailsToJson(LoginUserDetails data) =>
    json.encode(data.toJson());

class LoginUserDetails {
  LoginUserDetails({
    required this.status,
    required this.msg,
    required this.token,
    required this.userDetails,
  });

  final String status;
  final String msg;
  final String token;
  final UserDetails userDetails;

  factory LoginUserDetails.fromJson(Map<String, dynamic> json) =>
      LoginUserDetails(
        status: json["status"],
        msg: json["msg"],
        token: json["token"],
        userDetails: UserDetails.fromJson(json["userDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "token": token,
        "userDetails": userDetails.toJson(),
      };
}

class UserDetails {
  UserDetails({
    required this.id,
    required this.username,
    required this.fullname,
    required this.email,
    this.phoneNumber,
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
  final int? phoneNumber;
  final String avatar;
  final String bio;
  final List<dynamic> posts;
  final List<dynamic> followers;
  final List<dynamic> saved;
  final List<dynamic> following;
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
        posts: List<dynamic>.from(json["posts"].map((x) => x)),
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        saved: List<dynamic>.from(json["saved"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
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
        "posts": List<dynamic>.from(posts.map((x) => x)),
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
