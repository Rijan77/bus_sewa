import 'package:bus_sewa/app/core/common_widgets/text_style_widget.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/socials_shares/video_section.dart';
import 'package:flutter/material.dart';

class SocialsSharesMain extends StatefulWidget {
  const SocialsSharesMain({super.key});

  @override
  State<SocialsSharesMain> createState() => _SocialsSharesMainState();
}

class _SocialsSharesMainState extends State<SocialsSharesMain> {
  @override
  Widget build(BuildContext context) {
    print("building 2 ");
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [

                Text(
                  "Socials Shares",
                  style: TextStyleWidget.titleTextStyle(),
                ),
                const SizedBox(
                  width: 160,
                ),
                Text(
                  "View All>>",
                  style: TextStyleWidget.subTitleTextStyle(),
                )
              ],
            ),
          ),
          const VideoSection()
        ],
      ),
    );
  }
}
