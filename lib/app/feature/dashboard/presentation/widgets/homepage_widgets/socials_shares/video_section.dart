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
      "title": "Local Farming",
      "subtitle": "Grow your own food",
      "thumbnail":
          "https://i.pinimg.com/736x/b2/19/3f/b2193f38e115e719958d61670312b945.jpg",
    },
    {
      "url": "https://www.youtube.com/watch?v=hWHzwQfmEMA",
      "title": "Recycling Tips",
      "subtitle": "Reduce waste",
      "thumbnail":
          "https://i.pinimg.com/736x/ab/92/f6/ab92f64329183b1fcebb352d5539ca4e.jpg",
    },
  ];

  late List<String> _videoIds;
  late List<YoutubePlayerController?> _controllers;
  final ValueNotifier<int?> _currentlyPlayingIndex = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _videoIds =
        videos.map((v) => YoutubePlayer.convertUrlToId(v['url']!)!).toList();
    _controllers = List.generate(videos.length, (_) => null);
    // _currentlyPlayingIndex = null;
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  void _toggleVideo(int index) {
    if (_currentlyPlayingIndex.value == index) {
      // Pause and dispose the currently playing video
      _controllers[index]?.pause();
      _controllers[index]?.dispose();
      _controllers[index] = null;
      _currentlyPlayingIndex.value = null;
    } else {
      // Dispose previous playing controller safely
      if (_currentlyPlayingIndex.value != null) {
        final previousIndex = _currentlyPlayingIndex.value!;
        _controllers[previousIndex]?.pause();
        _controllers[previousIndex]?.dispose();
        _controllers[previousIndex] = null;
      }

      // Create and assign new controller
      _controllers[index] = YoutubePlayerController(
        initialVideoId: _videoIds[index],
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          enableCaption: false,
        ),
      );

      _currentlyPlayingIndex.value = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("building 1 ");

    return ValueListenableBuilder(
        valueListenable: _currentlyPlayingIndex,
        builder: (context, playingIndex, _) {
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: videos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final video = videos[index];
              final isPlaying = playingIndex == index;

              return GestureDetector(
                onTap: () => _toggleVideo(index),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Player or Thumbnail
                      if (isPlaying && _controllers[index] != null)
                        YoutubePlayer(
                          controller: _controllers[index]!,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.red,
                        )
                      else
                        Image.network(
                          video['thumbnail']!,
                          fit: BoxFit.cover,
                        ),

                      // Play icon (only show when not playing)
                      if (!isPlaying)
                        const Center(
                          child: Icon(
                            Icons.play_circle_fill,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),

                      // Gradient overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),

                      // Title and subtitle
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
                              Shadow(color: Colors.black54, blurRadius: 2)
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 8,
                        right: 8,
                        child: Text(
                          video['subtitle']!,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
