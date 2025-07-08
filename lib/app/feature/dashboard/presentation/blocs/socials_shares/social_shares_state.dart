part of 'social_shares_cubit.dart';

class SocialSharesState extends Equatable {
  final ApiStatus socialStatus;
  final List<SocialShareModel> getVideo;
  final String? error;

  SocialSharesState(
      {this.socialStatus = ApiStatus.initial,
      this.getVideo = const [],
      this.error});

  SocialSharesState copyWith({
    ApiStatus? socialStatus,
    List<SocialShareModel>? getVideo,
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
