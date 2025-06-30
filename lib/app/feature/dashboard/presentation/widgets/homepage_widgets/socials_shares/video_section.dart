import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoSection extends StatefulWidget {
  const VideoSection({super.key});

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  final List<Map<String, String>> videos = [
    {
      "url": "https://www.youtube.com/watch?v=RK7ZqQ4hhcs",
      "title": "",
      "subtitle": "."
    },
    {
      "url": "https://www.youtube.com/watch?v=hWHzwQfmEMA",
      "title": "",
      "subtitle": "."
    },
  ];

  late List<YoutubePlayerController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = videos.map((video) {
      final videoId = YoutubePlayer.convertUrlToId(video['url']!);
      return YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: videos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1, // Square box
      ),
      itemBuilder: (context, index) {
        final video = videos[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              YoutubePlayer(
                controller: _controllers[index],
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
                bottomActions: const [], // optional: hide controls
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 32,
                left: 8,
                right: 8,
                child: Text(
                  video['title']!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(color: Colors.black54, blurRadius: 2),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Positioned(
                bottom: 12,
                left: 8,
                right: 8,
                child: Text(
                  video['subtitle']!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
