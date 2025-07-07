import 'package:bloc/bloc.dart';
import 'package:bus_sewa/app/core/utils/api_status.dart';
import 'package:bus_sewa/app/feature/dashboard/data/models/offers_models/offers_items.dart';
import 'package:bus_sewa/app/feature/dashboard/data/repositories/mock_offer_implementation%20.dart';
import 'package:equatable/equatable.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersState());

  MockOfferService mockOfferService = MockOfferService();

  Future<void> fetchOffers() async{
    emit(state.copyWith(offerStatus: ApiStatus.loading));

    try{
      final fetchOfferData = mockOfferService.setOffer();

      emit(state.copyWith(offerStatus: ApiStatus.success, getOfferModel: await fetchOfferData));
    }
    catch(e){
      emit(state.copyWith(offerStatus: ApiStatus.failure, error: "Error to Load Offers Data"));
    }

  }
}
