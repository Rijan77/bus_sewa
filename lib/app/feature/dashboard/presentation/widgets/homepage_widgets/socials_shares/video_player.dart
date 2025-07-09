import 'package:bus_sewa/app/core/utils/api_status.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/socials_shares/social_shares_cubit.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/socials_shares/video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {

  @override
  void initState() {
    // TODO: implement initState
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

            return Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.getVideo.map((items) {
                    return VideoItem(video: items,);
                  }).toList(), // ✅ convert Iterable to List
                ),
              ),
            );


            // return PageView.builder(
            //   scrollDirection: Axis.vertical,
            //   itemCount: state.getVideo.length,
            //   controller: controller,
            //   onPageChanged: (index) => setState(() => currentPage = index),
            //   itemBuilder: (context, index) {
            //     final item = state.getVideo[index];
            //     return VideoItem(
            //       image: item.image,
            //     );
            //   },
            // );
          }
          return const SizedBox.shrink();
        });
  }
}


