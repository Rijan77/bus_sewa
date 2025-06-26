import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RsLocation extends StatelessWidget {
  final List<RsLocationItem> items;

  const RsLocation({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10),

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: items.map((item){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 55.h, // Use .h instead of .sp for height
                width: 270.w, // Use .w for width
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.6, color: Colors.black26),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        item.heading,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xff001A42),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.subHeading,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff8087B0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList()
        ),
      )


    );
  }
}

class RsLocationItem {
  final String heading;
  final String subHeading;

  RsLocationItem({
    required this.heading,
    required this.subHeading,
  });
}
