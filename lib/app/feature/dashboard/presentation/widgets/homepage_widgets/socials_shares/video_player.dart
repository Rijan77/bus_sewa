import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {

  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();

}

class _VideoPlayerState extends State<VideoPlayer> {
  PageController controller=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: controller,
        children: [
          Container(
            color: Colors.blueGrey,
          ),
          Container(
            color: Colors.greenAccent,
          ),

          Container(
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
