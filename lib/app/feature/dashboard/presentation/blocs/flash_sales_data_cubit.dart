import 'package:bloc/bloc.dart';
import '../../../../core/utils/api_status.dart';
import '../../data/models/flash_sales_models/flash_sales_model.dart';
import '../../data/repositories/mock_flash_sale_repo_implementation.dart';
import 'flash_sales_data_state.dart';

class FlashSalesDataCubit extends Cubit<FlashSaleDataState> {
  FlashSalesDataCubit() : super(const FlashSaleDataState());

  FlashSaleRepoImple flashSaleRepoImple = FlashSaleRepoImple();

  Future<void> fetchData() async {
    emit(state.copyWith(status: ApiStatus.loading));

    try {
      final List<FlashSaleModel> flashSales = await flashSaleRepoImple.flashSale();
      emit(state.copyWith(status: ApiStatus.success, flashSales: flashSales));
    } catch (e) {
      emit(state.copyWith(
          status: ApiStatus.failure, error: "Failed to Load Data"));
    }
  }
}
