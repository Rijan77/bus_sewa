import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class GiftSectionMain extends StatefulWidget {
  const GiftSectionMain({super.key});

  @override
  State<GiftSectionMain> createState() => _GiftSectionMainState();
}

class _GiftSectionMainState extends State<GiftSectionMain> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: SizedBox(
        height: 65, // Set this to your exact image height
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            viewportFraction: 0.95,
            height: 50, 
            enableInfiniteScroll: true,
          ),
          items: [
            giftCard("assets/images/Frame 1171276782.png"),
            giftCard("assets/images/Offer Card (1).png"),
          ],
        ),
      ),
    );
  }

  Widget giftCard(String imagePath) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover, // Fill the space without distortion
      height: double.infinity, // Take all available height
      width: double.infinity, // Take all available width
    );
  }
}