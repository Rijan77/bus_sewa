import 'package:bloc/bloc.dart';
import 'package:bus_sewa/app/core/utils/api_status.dart';
import 'package:bus_sewa/app/feature/dashboard/data/models/socials_shares_models/social_share_model.dart';
import 'package:bus_sewa/app/feature/dashboard/data/repositories/socials_shares_implementation.dart';
import 'package:equatable/equatable.dart';

part 'social_shares_state.dart';

class SocialSharesCubit extends Cubit<SocialSharesState> {
  SocialSharesCubit() : super(SocialSharesState());

  SocialSharesImplementation socialSharesImplementation =
      SocialSharesImplementation();

  Future<void> fetchSocialShare() async {
    emit(state.copyWith(socialStatus: ApiStatus.loading));

    try {
      final List<SocialShareModel> getSocialShare =
          await socialSharesImplementation.fetchVideo();

      emit(state.copyWith(
          socialStatus: ApiStatus.success, getVideo: getSocialShare));
    } catch (e) {
      emit(state.copyWith(
          socialStatus: ApiStatus.failure, error: "Error to Fetch Video"));
    }
  }
}
