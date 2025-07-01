import '../../data/models/offers_models/offers_items.dart';
import 'dart:async';

class MockOfferService {
  static Future<List<OfferModel>> fetchOffers() async {
    await Future.delayed(const Duration(seconds: 1));

    final data = [
      {
        "imageUrl":
            "https://i.pinimg.com/736x/65/20/94/652094e35710c83914f433fc04579f9b.jpg",
        "offerType": "Rental",
        "title": "Black Friday Deals!",
        "subTitle": "Valid Till: 5 Dec 2024"
      },
      {
        "imageUrl":
            "https://i.pinimg.com/736x/49/f4/0d/49f40d48ee9372e7e6ebcd312b2ce6c5.jpg",
        "offerType": "Flights",
        "title": "Everest Flight",
        "subTitle": "Valid Till: 5 Dec 2024",
      },
      {
        "imageUrl":
            "https://i.pinimg.com/736x/35/4a/aa/354aaa6985aa4fdc198dc30145e6023a.jpg",
        "offerType": "Rental",
        "title": "Black Friday Deals!",
        "subTitle": "Valid Till: 5 Dec 2024",
      }
    ];
    return data.map((json) => OfferModel.fromJson(json)).toList();
  }
}
