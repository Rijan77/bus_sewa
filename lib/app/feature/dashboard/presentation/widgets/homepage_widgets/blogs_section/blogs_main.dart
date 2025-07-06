import 'package:bus_sewa/app/core/common_widgets/text_style_widget.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/promo_code/pc_button.dart';
import 'package:flutter/material.dart';

import 'blog_section.dart';

class BlogsMain extends StatefulWidget {
  const BlogsMain({super.key});

  @override
  State<BlogsMain> createState() => _BlogsMainState();
}

class _BlogsMainState extends State<BlogsMain> {
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
              children: [
                Text(
                  "Blogs",
                  style: TextStyleWidget.titleTextStyle(),
                ),
                const SizedBox(
                  width: 210,
                ),
                Text(
                  "View All >>",
                  style: TextStyleWidget.subTitleTextStyle(),
                )
              ],
            ),
          ),
          PcButton(),
          const BlogSection(),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          )
        ],
      ),
    );
  }
}
