import 'dart:async';

import 'package:bus_sewa/app/feature/dashboard/data/models/flash_sales_models/flash_sales_model.dart';
import 'package:bus_sewa/app/feature/dashboard/domain/repositories/flash_repo_abstract.dart';

class FlashSaleRepoImple implements FlashRepoAbstract {
  @override
  Future<List<FlashSaleModel>> flashSale() async {
    await Future.delayed(const Duration(seconds: 1));

    final flashData = [
      {
        "time": "1H 40M left",
        "discount": "Get 20% OFF",
        "hotelName": "Meghauli Hotel",
        "imageUrl": "assets/images/Frame 1171275916 (1).png"
      },
      {
        "time": "9H 40M left",
        "discount": "Get 10% OFF",
        "hotelName": "Diyalo Hotel",
        "imageUrl": "assets/images/Frame 1171275917.png"
      },
      {
        "time": "3H 40M left",
        "discount": "Get 60% OFF",
        "hotelName": "Rijan Hotel",
        "imageUrl": "assets/images/Frame 1171275918.png"
      },
      {
        "time": "1H 40M left",
        "discount": "Get 40% OFF",
        "hotelName": "Meghauli Hotel",
        "imageUrl": "assets/images/Frame 1171275917.png"
      },
    ];

    return flashData.map((json) => FlashSaleModel.fromJson(json)).toList();
  }
}
