
import 'package:flutter/material.dart';
import 'package:bus_sewa/app/feature/dashboard/data/models/video_model.dart';

import 'full_screen_video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final List<VideoModel> videos;
  final int startIndex;

  const VideoPlayerPage({
    super.key,
    required this.videos,
    required this.startIndex,
  });

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.startIndex;
    _pageController = PageController(initialPage: widget.startIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: widget.videos.length,
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
        itemBuilder: (context, index) {
          final video = widget.videos[index];
          return Center(
            child: FullScreenVideoPlayer(
              videoUrl: video.videoUrl,
              userName: video.userName,
              isActive: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}
