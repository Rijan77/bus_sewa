
import 'package:bus_sewa/app/feature/dashboard/data/models/flash_sales_models/flash_sales_model.dart';

abstract class FlashRepoAbstract{
  Future<List<FlashSaleModel>> flashSale();
}