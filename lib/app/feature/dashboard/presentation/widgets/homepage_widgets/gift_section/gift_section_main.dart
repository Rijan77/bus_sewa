import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftSectionMain extends StatefulWidget {
  const GiftSectionMain({super.key});

  @override
  State<GiftSectionMain> createState() => _GiftSectionMainState();
}

class _GiftSectionMainState extends State<GiftSectionMain> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          viewportFraction: 0.95,
          height: 70.sp,
          enableInfiniteScroll: true,
        ),
        items: [
          giftCard(
              "https://i.pinimg.com/736x/d5/fe/e6/d5fee6443203ceb01a282e930699cd95.jpg"),
          giftCard(
              "https://i.pinimg.com/736x/44/ad/5d/44ad5da205f3ef5b737da82012119b51.jpg"),
        ],
      ),
    );
  }

  Widget giftCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imagePath,
        fit: BoxFit.cover, // Fill the space without distortion
        height: double.infinity, // Take all available height
        width: double.infinity, // Take all available width
      ),
    );
  }
}
