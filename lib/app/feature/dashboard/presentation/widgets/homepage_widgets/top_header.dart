import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopHeaderWidget extends StatelessWidget {
  final List<HeaderItem> items;

  const TopHeaderWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        children: items.map((item) {
          return Expanded(
            child: Card(
              elevation: 4,
              color: Colors.white,
              child: SizedBox(
                // width: 80.w, // or adjust fixed width to fit 4 in a row if needed
                height: 70.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40, width: 40, child: item.image),
                    const SizedBox(height: 8),
                    Text(
                      item.label,
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class HeaderItem {
  final SvgPicture image;
  final String label;

  HeaderItem({required this.image, required this.label});
}
