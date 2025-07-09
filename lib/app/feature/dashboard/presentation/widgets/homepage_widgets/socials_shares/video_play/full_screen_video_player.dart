import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String userName;
  final bool isActive;

  const FullScreenVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.userName,
    required this.isActive,
  });

  @override
  State<FullScreenVideoPlayer> createState() => _VideoItemState();
}

class _VideoItemState extends State<FullScreenVideoPlayer> {
  late VideoPlayerController _controller;
  bool isPressed = false;
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..setVolume(1.0)
      ..initialize().then((_) {
        if (widget.isActive) _controller.play();
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(FullScreenVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive) {
      _controller.play();
    } else {
      _controller.pause();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: InkWell(
        onTap: (){
          setState(() {
            if (_controller.value.isPlaying){
              _controller.pause();
            } else{
              _controller.play();
            }
          });
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            _controller.value.isInitialized
                ? FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : Center(child: CircularProgressIndicator( color: Colors.white,)),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.white,size: 40,)),
                ),




              ],
            ),
            Center(
              child: _controller.value.isInitialized && !_controller.value.isPlaying
                  ? Icon(Icons.play_arrow, color: Colors.white, size: 70)
                  : SizedBox.shrink(),



              // child: _controller.value.isPlaying
                //     ? SizedBox.shrink()
                //     : Icon(Icons.play_arrow, color: Colors.white, size: 70),
              ),




            /// Right-side vertical buttons
            Padding(
              padding: const EdgeInsets.only(top: 480),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isPressed = !isPressed;
                      });
                    },
                    icon: Icon(
                      isPressed ? Icons.favorite : Icons.favorite_border_rounded,
                      color: isPressed ? Colors.red : Colors.white,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.comment_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isBookmarked = !isBookmarked;
                      });
                    },
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),

            /// Bottom-left user info + description
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: 280,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 40,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            widget.userName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "When you're watching a video, tap the bookmark icon (usually located on the right side).",
                          style:
                              const TextStyle(fontSize: 12, color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
