
import 'package:bus_sewa/app/feature/dashboard/data/models/promo_codes_models/promo_code_model_main.dart';

class MockPromoCodes{

  static Future <List<PromoCodeModel>> fetchPromoCodes() async{
    await Future.delayed(Duration(seconds: 1));

    final promoData=[
      {
        "imageUrl": "assets/images/Offer Image.png",
        "title": "Dashain Promo",
        "subTitle": "Valid Till 5 Dec 2024"
      },
      {
        "imageUrl": "assets/images/Offer Image_2.png",
        "title": "Black Friday Deals!",
        "subTitle": "Valid Till 5 Dec 2024"
      },
    ];
    return promoData.map((json)=> PromoCodeModel.fromJson(json)).toList();
  }

}