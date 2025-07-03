import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'promo_codes_state.dart';

class PromoCodesCubit extends Cubit<PromoCodesState> {
  PromoCodesCubit() : super(PromoCodesInitial());
}
