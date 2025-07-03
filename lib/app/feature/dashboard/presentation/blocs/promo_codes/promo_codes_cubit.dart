import 'package:bloc/bloc.dart';
import 'package:bus_sewa/app/core/utils/api_status.dart';
import 'package:bus_sewa/app/feature/dashboard/data/models/promo_codes_models/promo_code_model_main.dart';
import 'package:bus_sewa/app/feature/dashboard/data/repositories/promocodes_implementation.dart';
import 'package:equatable/equatable.dart';

part 'promo_codes_state.dart';

class PromoCodesCubit extends Cubit<PromoCodesState> {
  PromoCodesCubit() : super(PromoCodesState());

  PromocodesImplementation promocodesImplementation = PromocodesImplementation();


  Future<void> fetchPromoCode() async{

    emit(state.copyWith(promoCodeStatus: ApiStatus.loading));

    try {
      final List<PromoCodeModel> promoModel = await promocodesImplementation.getPromoCodes();
      emit(state.copyWith(promoCodeStatus: ApiStatus.success, promoModel: promoModel));
    }
    catch (e){
      emit(state.copyWith(promoCodeStatus: ApiStatus.failure, error: "Error to Load Data"));
    }

  }



}
