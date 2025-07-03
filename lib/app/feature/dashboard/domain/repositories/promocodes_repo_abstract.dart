
import 'package:bus_sewa/app/feature/dashboard/data/models/promo_codes_models/promo_code_model_main.dart';

abstract class PromocodesRepoAbstract {

  Future<List<PromoCodeModel>> getPromoCodes();

}