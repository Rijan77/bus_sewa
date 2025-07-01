import 'package:flutter/material.dart';

class OfferModel {
  final String imageUrl;
  final String offerType;
  final String title;
  final String subTitle;

  OfferModel({
    required this.imageUrl,
    required this.offerType,
    required this.title,
    required this.subTitle,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
        imageUrl: json["imageUrl"],
        offerType: json["offerType"],
        title: json["title"],
        subTitle: json["subTitle"]);
  }
}
