import 'package:equatable/equatable.dart';

import '../../../../core/utils/api_status.dart';
import '../../data/models/flash_sales_models/flash_sales_model.dart';

class FlashSaleDataState extends Equatable {
  final ApiStatus status;
  final List<FlashSaleModel> flashSales;
  final String? error;

  const FlashSaleDataState(
      {this.status = ApiStatus.initial,
      this.flashSales = const [],
      this.error});

  FlashSaleDataState copyWith(
      {ApiStatus? status, List<FlashSaleModel>? flashSales, String? error}) {
    return FlashSaleDataState(
        status: status ?? this.status,
        flashSales: flashSales ?? this.flashSales,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [
        status,
        flashSales,
        error,
      ];
}
