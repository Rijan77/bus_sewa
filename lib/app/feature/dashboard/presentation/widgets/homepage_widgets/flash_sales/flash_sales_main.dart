import 'package:bus_sewa/app/core/common_widgets/text_style_widget.dart';
import 'package:flutter/material.dart';
import '../clip_button/clip_button.dart';
import 'image_info_section.dart';

class FlashSalesMain extends StatefulWidget {
  const FlashSalesMain({super.key});

  @override
  State<FlashSalesMain> createState() => _FlashSalesMainState();
}

class _FlashSalesMainState extends State<FlashSalesMain> {
  final ValueNotifier<String> selectedValue = ValueNotifier<String>("All");

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      // elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Flash Sales",
                  style: TextStyleWidget.titleTextStyle(),
                ),
                //  SizedBox(
                //   width: 0.4.sw,
                // ),
                Text(
                  "View All>>",
                  style: TextStyleWidget.subTitleTextStyle(),
                )
              ],
            ),
          ),
          ClipButton(
            selectedValue: selectedValue,
          ),
          ValueListenableBuilder(
              valueListenable: selectedValue,
              builder: (context, value, _) {
                return ImageInfoSection(selectedType: value);
              })
        ],
      ),
    );
  }
}
