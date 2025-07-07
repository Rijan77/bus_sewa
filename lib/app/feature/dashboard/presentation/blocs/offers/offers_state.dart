part of 'offers_cubit.dart';

class OffersState extends Equatable {
  final ApiStatus offerStatus;
  final List<OfferModel> getOfferModel;
  final String? error;

  OffersState(
      {this.offerStatus = ApiStatus.initial,
      this.getOfferModel = const [],
      this.error});

  OffersState copyWith(
      {ApiStatus? offerStatus,
      List<OfferModel>? getOfferModel,
      String? error}) {
    return OffersState(
        offerStatus: offerStatus ?? this.offerStatus,
        getOfferModel: getOfferModel ?? this.getOfferModel,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [offerStatus, getOfferModel, error];
}
