
import 'package:bus_sewa/app/feature/dashboard/data/models/offers_models/offers_items.dart';

abstract class OfferRepoAbstract{

  Future<List<OfferModel>> setOffer();

}