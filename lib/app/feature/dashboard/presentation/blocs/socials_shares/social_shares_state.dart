part of 'social_shares_cubit.dart';

class SocialSharesState extends Equatable {
  final ApiStatus socialStatus;
  final List<VideoModel> getVideo;
  final String? error;

  const SocialSharesState(
      {this.socialStatus = ApiStatus.initial,
      this.getVideo = const [],
      this.error});

  SocialSharesState copyWith({
    ApiStatus? socialStatus,
    List<VideoModel>? getVideo,
    String? error,
  }) {
    return SocialSharesState(
        socialStatus: socialStatus ?? this.socialStatus,
        getVideo: getVideo ?? this.getVideo,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [socialStatus, getVideo, error];
}
