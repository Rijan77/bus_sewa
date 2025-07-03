import 'package:bus_sewa/app/feature/dashboard/data/models/promo_codes_models/promo_code_model_main.dart';

class MockPromoCodes {
  static Future<List<PromoCodeModel>> fetchPromoCodes() async {
    await Future.delayed(const Duration(seconds: 1));

    final promoData = [
      {
        "imageUrl": "https://i.pinimg.com/736x/f4/7b/d1/f47bd10bf1a15e2f6ef17ed0c0a428a1.jpg",
        "title": "Dashain Promo",
        "subTitle": "Valid Till 5 Dec 2024"
      },
      {
        "imageUrl": "https://i.pinimg.com/736x/df/a3/04/dfa3049dccc07b42473a8062f6937a53.jpg",
        "title": "Black Friday Deals!",
        "subTitle": "Valid Till 5 Dec 2024"
      },
      {
        "imageUrl": "https://i.pinimg.com/736x/eb/a9/f4/eba9f4bab0a0eafb208ef430c7878067.jpg",
        "title": "Dashain Promo",
        "subTitle": "Valid Till 5 Dec 2024"
      },
      {
        "imageUrl": "https://i.pinimg.com/736x/48/5d/2c/485d2cff248dd4d4550d3c0b090b9d35.jpg",
        "title": "Tihar Promo",
        "subTitle": "Valid Till 5 Dec 2024"
      }


    ];
    return promoData.map((json) => PromoCodeModel.fromJson(json)).toList();
  }
}
