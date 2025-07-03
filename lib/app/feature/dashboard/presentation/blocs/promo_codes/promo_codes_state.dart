part of 'promo_codes_cubit.dart';

class PromoCodesState extends Equatable {
  final ApiStatus promoCodeStatus;
  final List<PromoCodeModel> promoModel;
  final String? error;

  const PromoCodesState(
      {this.promoCodeStatus = ApiStatus.initial,
      this.promoModel = const [],
      this.error});

  PromoCodesState copyWith(
      {ApiStatus? promoCodeStatus,
      List<PromoCodeModel>? promoModel,
      String? error}) {
    return PromoCodesState(
        promoCodeStatus: promoCodeStatus ?? this.promoCodeStatus,
        promoModel: promoModel ?? this.promoModel,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [
        promoCodeStatus,
        promoModel,
        error,
      ];
}
