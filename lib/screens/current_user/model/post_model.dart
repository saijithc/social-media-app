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
    required this.createdAt,
    required this.comments,
    required this.updatedAt,
  });

  final String id;
  final String userId;
  final String image;
  final String caption;
  final List<dynamic> hashtags;
  final List<dynamic> likes;
  final List<dynamic> savedBy;
  final String createdAt;
  final List<dynamic> comments;
  final DateTime updatedAt;

  factory GetPostModel.fromJson(Map<String, dynamic> json) => GetPostModel(
        id: json["_id"],
        userId: "user",
        image: json["image"],
        caption: json["caption"],
        hashtags: List<dynamic>.from(json["hashtags"].map((x) => x)),
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        savedBy: List<dynamic>.from(json["savedBy"].map((x) => x)),
        createdAt: json["createdAt"],
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "image": image,
        "caption": caption,
        "hashtags": List<dynamic>.from(hashtags.map((x) => x)),
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "savedBy": List<dynamic>.from(savedBy.map((x) => x)),
        "createdAt": createdAt,
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "updatedAt": updatedAt.toIso8601String()
      };
}
