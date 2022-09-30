import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';

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

// To parse this JSON data, do
//
//     final getPostModel = getPostModelFromJson(jsonString);

List<GetPostModel> getPostModelFromJson(List list) =>
    List<GetPostModel>.from(list.map((x) => GetPostModel.fromJson(x)));

String getPostModelToJson(List<GetPostModel> data) =>
    json.encode(List<String>.from(data.map((x) => x.toJson())));

class GetPostModel {
  GetPostModel({
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
  final UserId userId;
  final String image;
  final String caption;
  final List<dynamic> hashtags;
  final List<String> likes;
  final List<dynamic> savedBy;
  final List<dynamic> comments;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory GetPostModel.fromJson(Map<String, dynamic> json) => GetPostModel(
        id: json["_id"],
        userId: UserId.fromJson(json["userId"]),
        image: json["image"],
        caption: json["caption"],
        hashtags: List<dynamic>.from(json["hashtags"].map((x) => x)),
        likes: List<String>.from(json["likes"].map((x) => x)),
        savedBy: List<dynamic>.from(json["savedBy"].map((x) => x)),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId.toJson(),
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

class UserId {
  UserId({
    required this.id,
    required this.username,
    required this.fullname,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.avatar,
    required this.bio,
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
  final int phoneNumber;
  final String password;
  final String avatar;
  final String bio;
  final List<dynamic> followers;
  final List<dynamic> saved;
  final List<dynamic> following;
  final bool private;
  final bool blocked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        avatar: json["avatar"],
        bio: json["bio"],
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
        "password": password,
        "avatar": avatar,
        "bio": bio,
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
