

import 'package:bus_sewa/app/feature/dashboard/data/models/socials_shares_models/social_share_model.dart';

abstract class SocialsSharesAbstract {
  Future<List<SocialShareModel>> fetchVideo();

}