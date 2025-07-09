import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/socials_shares/video_show/video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/api_status.dart';
import '../../../../blocs/socials_shares/social_shares_cubit.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  void initState() {
    super.initState();
    context.read<SocialSharesCubit>().fetchSocialShare();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialSharesCubit, SocialSharesState>(
      builder: (context, state) {
        if (state.socialStatus == ApiStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.socialStatus == ApiStatus.failure) {
          return const Center(child: Text("Error to Load Social Shares"));
        } else if (state.socialStatus == ApiStatus.success) {
          Future.delayed(Duration(microseconds: 1));
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(state.getVideo.length, (index) {
                  final video = state.getVideo[index];
                  return VideoItem(
                    video: video,
                    allVideos: state.getVideo,
                    currentIndex: index,
                  );
                }),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
