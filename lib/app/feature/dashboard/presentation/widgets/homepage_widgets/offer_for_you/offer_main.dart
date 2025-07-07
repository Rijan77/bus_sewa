import 'package:bus_sewa/app/core/common_widgets/text_style_widget.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/promo_code/pc_button.dart';
import 'package:flutter/material.dart';

import 'offer_image_section.dart';

class OfferMain extends StatefulWidget {
  const OfferMain({super.key});

  @override
  State<OfferMain> createState() => _OfferMainState();
}

class _OfferMainState extends State<OfferMain> {
  final ValueNotifier<String> selectedOffer = ValueNotifier("All");

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Offers for you",
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
          PcButton(selectedValue: selectedOffer),
          ValueListenableBuilder(
              valueListenable: selectedOffer,
              builder: (context, value, _) {
                return OfferImageSection(
                  selectedType: value,
                );
              }),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          )
        ],
      ),
    );
  }
}
