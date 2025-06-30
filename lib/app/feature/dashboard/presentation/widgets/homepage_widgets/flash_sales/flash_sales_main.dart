
import 'package:bus_sewa/app/core/common_widgets/text_style_widget.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/promo_code/pc_button.dart';
import 'package:flutter/material.dart';

class FlashSalesMain extends StatefulWidget {
  const FlashSalesMain({super.key});

  @override
  State<FlashSalesMain> createState() => _FlashSalesMainState();
}

class _FlashSalesMainState extends State<FlashSalesMain> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Row(
            children: [
              Text("Flash Sales", style: TextStyleWidget.titleTextStyle(),),

              const SizedBox(width: 180,),

              Text("View All>>", style: TextStyleWidget.subTitleTextStyle(),)
            ],
          ),
          PcButton()
        ],
      ),
      
    );
  }
}
