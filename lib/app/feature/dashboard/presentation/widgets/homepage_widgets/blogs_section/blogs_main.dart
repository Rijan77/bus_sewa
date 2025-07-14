import 'package:bus_sewa/app/core/common_widgets/text_style_widget.dart';
import 'package:flutter/material.dart';

import '../clip_button/clip_button.dart';
import 'blog_section.dart';

class BlogsMain extends StatefulWidget {
  const BlogsMain({super.key});

  @override
  State<BlogsMain> createState() => _BlogsMainState();
}

class _BlogsMainState extends State<BlogsMain> {
  final ValueNotifier<String> selectedBlogs = ValueNotifier("All");

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 2,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Blogs",
                  style: TextStyleWidget.titleTextStyle(),
                ),
                //  SizedBox(
                //   width: 0.53.sw,
                // ),
                Text(
                  "View All >>",
                  style: TextStyleWidget.subTitleTextStyle(),
                )
              ],
            ),
          ),
          ClipButton(selectedValue: selectedBlogs),
          ValueListenableBuilder(
              valueListenable: selectedBlogs,
              builder: (context, value, _) {
                return BlogSection(
                  selectedType: value,
                );
              }),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          )
        ],
      ),
    );
  }
}
