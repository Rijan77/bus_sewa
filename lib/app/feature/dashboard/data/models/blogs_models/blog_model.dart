import 'package:flutter/material.dart';

class BlogModel {
  final String imageUrl;
  final String title;
  final String date;
  final String description;
  final Icon viewIcon;
  final int viewCount;
  final Icon commentIcon;
  final int commentCount;

  BlogModel(
      {required this.imageUrl,
      required this.title,
      required this.date,
      required this.description,
      required this.viewIcon,
      required this.viewCount,
      required this.commentIcon,
      required this.commentCount});

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
        imageUrl: json["imageUrl"],
        title: json['title'],
        date: json['date'],
        description: json['description'],
        viewIcon: json['viewIcon'],
        viewCount: json['viewCount'],
        commentIcon: json['commentIcon'],
        commentCount: json['commentCount']);
  }
}
