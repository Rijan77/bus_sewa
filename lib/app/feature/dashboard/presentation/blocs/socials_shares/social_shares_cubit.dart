import 'package:bloc/bloc.dart';
import 'package:bus_sewa/app/core/utils/api_status.dart';
import 'package:bus_sewa/app/feature/dashboard/data/models/video_model.dart';
import 'package:bus_sewa/app/feature/dashboard/data/repositories/video_api.dart';
import 'package:equatable/equatable.dart';

part 'social_shares_state.dart';

class SocialSharesCubit extends Cubit<SocialSharesState> {
  SocialSharesCubit() : super(SocialSharesState());

  VideoApi videoApi = VideoApi();



  Future<void> fetchSocialShare() async {
    emit(state.copyWith(socialStatus: ApiStatus.loading));

    try {
      final List<VideoModel> videos = await videoApi.fetchVideos();

      emit(state.copyWith(
          socialStatus: ApiStatus.success, getVideo: videos));
    } catch (e) {
      emit(state.copyWith(
          socialStatus: ApiStatus.failure, error: "Error to Fetch Video"));
    }
  }
}
