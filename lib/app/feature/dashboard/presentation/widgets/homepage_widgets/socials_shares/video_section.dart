import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      "thumbnail": "https://i.pinimg.com/736x/b2/19/3f/b2193f38e115e719958d61670312b945.jpg",
    },
    {
      "url": "https://www.youtube.com/watch?v=hWHzwQfmEMA",
      "title": "Recycling Tips",
      "subtitle": "Reduce waste",
      "thumbnail": "https://i.pinimg.com/736x/ab/92/f6/ab92f64329183b1fcebb352d5539ca4e.jpg",
    },
    {
      "url": "https://www.youtube.com/watch?v=RK7ZqQ4hhcs",
      "title": " Renewable Practices",
      "subtitle": "Understand the basics of eco-energy and composting.",
      "thumbnail": "https://i.pinimg.com/736x/f0/4a/af/f04aaf38f13cfe7eca4a2ddbcb2ea505.jpg",
    },
    {
      "url": "https://www.youtube.com/watch?v=hWHzwQfmEMA",
      "title": "My First Flight",
      "subtitle": "Follow a journey that blends travel with environmental awareness.",
      "thumbnail": "https://i.pinimg.com/736x/fa/b8/4f/fab84f31b440c5cb13b41275ed246c61.jpg",
    },
  ];

  late List<String> _videoIds;
  late List<YoutubePlayerController?> _controllers;
  final ValueNotifier<int?> _currentlyPlayingIndex = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _videoIds = videos.map((v) => YoutubePlayer.convertUrlToId(v['url']!)!).toList();
    _controllers = List.generate(videos.length, (_) => null);
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
      _controllers[index]?.pause();
      _controllers[index]?.dispose();
      _controllers[index] = null;
      _currentlyPlayingIndex.value = null;
    } else {
      if (_currentlyPlayingIndex.value != null) {
        final previousIndex = _currentlyPlayingIndex.value!;
        _controllers[previousIndex]?.pause();
        _controllers[previousIndex]?.dispose();
        _controllers[previousIndex] = null;
      }

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
    return SingleChildScrollView(
      child: ValueListenableBuilder<int?>(
        valueListenable: _currentlyPlayingIndex,
        builder: (context, playingIndex, _) {
          return SizedBox(
            height: 190.sp, // Adjust the height as needed
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              scrollDirection: Axis.horizontal,
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                final isPlaying = playingIndex == index;
      
                return GestureDetector(
                  onTap: () => _toggleVideo(index),
                  child: Container(
                    width: 130.sp,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.sp),
                      color: Colors.grey[300],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.sp),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Video player or thumbnail
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
      
                          // Play button overlay
                          if (!isPlaying)
                            const Center(
                              child: Icon(
                                Icons.play_circle_fill,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
      
                          // Gradient overlay
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
      
                          // Title and subtitle
                          Positioned(
                            bottom: 26,
                            left: 8,
                            right: 8,
                            child: Text(
                              video['title']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [Shadow(color: Colors.black54, blurRadius: 2)],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 8,
                            right: 8,
                            child: Text(
                              video['subtitle']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
