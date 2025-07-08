

import 'package:bus_sewa/app/feature/dashboard/data/models/socials_shares_models/social_share_model.dart';
import 'package:bus_sewa/app/feature/dashboard/domain/repositories/socials_shares_abstract.dart';

class SocialSharesImplementation implements SocialsSharesAbstract{

  @override
  Future <List<SocialShareModel>> fetchVideo() async {
    await Future.delayed(const Duration(seconds: 1));

    final videoList = [
      {
        'videoUrl': "https://www.tiktok.com/@khaby.lame/video/7501786655280336150?is_from_webapp=1&sender_device=pc&web_id=7413781296491562514",
        'title': "Local Farming",
        "subTitle": "Grow your own food"

      },
      {
        'videoUrl': "https://www.youtube.com/watch?v=RK7ZqQ4hhcs",
        'title': "Recycling Tips",
        "subTitle": "Reduce waste"

      },
      {
        'videoUrl': "https://www.youtube.com/watch?v=hWHzwQfmEMA",
        'title': "Renewable Practices",
        "subTitle": "Grow your own food"

      },
      {
        'videoUrl': "https://www.youtube.com/watch?v=hWHzwQfmEMA",
        'title': "My First Flight",
        "subTitle": "Follow a journey that blends travel with environmental awareness."

      },
    ];

    return videoList.map((json)=> SocialShareModel.fromJson(json)).toList();



  }
}