import 'package:bus_sewa/app/feature/dashboard/data/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoItem extends StatefulWidget {
  final VideoModel video;

  const VideoItem({super.key, required this.video});

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 190.sp,
            width: 150.sp,
            decoration: BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.sp),
              child: Image.network(
                widget.video.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.play_arrow_sharp,
              color: Color(0xffDDDDDD).withOpacity(1),
              size: 100.sp, // Use .sp for responsive sizing
            ),
          ),
          Positioned(
              left: 8.sp,
              bottom: 17.sp,
              right: 40.sp,
              child: Text(
                widget.video.userName,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              )),
          Positioned(
              left: 8.sp,
              bottom: 2.sp,
              right: 40.sp,
              child: Text(
                "My first astetic video",
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400),
              ))
        ],
      ),
    );
  }
}
