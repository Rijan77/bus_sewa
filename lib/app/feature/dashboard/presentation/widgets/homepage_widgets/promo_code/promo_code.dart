
import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/promo_code/pc_button.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/promo_code/pc_container_image.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/promo_code/pc_header_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromoCode extends StatefulWidget {
  const PromoCode({super.key});

  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,

      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10)

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PcHeaderSection(),
          PcButton(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PcContainerImage(items: [
                  PcContainerImageItem(image: Image.asset("assets/images/Offer Image.png", fit: BoxFit.cover,), title: "Dashain Promo", subtitle: "Valid Till 5 Dec 2024", buttonText: "Collect"),
                  PcContainerImageItem(image: Image.asset("assets/images/Offer Image_2.png", fit: BoxFit.cover,), title: "Black Friday Deals!", subtitle: "Valid Till 5 Dec 2024", buttonText: "Collect"),
                ],)
              ],
            ),
          )

        ],
      ),
    );
  }
}
