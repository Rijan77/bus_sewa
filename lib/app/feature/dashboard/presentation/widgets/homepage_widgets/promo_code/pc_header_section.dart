import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/text_style_widget.dart';

class PcHeaderSection extends StatelessWidget {
  const PcHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            "Promo Codes",
            style: TextStyleWidget.titleTextStyle()
          ),
          //  SizedBox(
          //   width: 0.4.sw,
          // ),
          InkWell(
              onTap: () {},
              child:  Text(
                "View All>>",
                style: TextStyleWidget.subTitleTextStyle(),
              ))
        ],
      ),
    );
  }
}
