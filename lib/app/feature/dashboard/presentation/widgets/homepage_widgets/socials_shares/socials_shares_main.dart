import 'package:bus_sewa/app/core/common_widgets/text_style_widget.dart';
import 'package:flutter/material.dart';

class SocialsSharesMain extends StatefulWidget {
  const SocialsSharesMain({super.key});

  @override
  State<SocialsSharesMain> createState() => _SocialsSharesMainState();
}

class _SocialsSharesMainState extends State<SocialsSharesMain> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Text("Blogs", style: TextStyleWidget.titleTextStyle(),),
                SizedBox(width: 220,),
                Text("View All>>", style: TextStyleWidget.subTitleTextStyle(),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
