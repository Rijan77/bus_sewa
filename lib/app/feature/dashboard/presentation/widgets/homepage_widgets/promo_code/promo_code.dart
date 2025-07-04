import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/promo_code/pc_button.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/promo_code/pc_container_image.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/promo_code/pc_header_section.dart';
import 'package:flutter/material.dart';

class PromoCode extends StatefulWidget {
  const PromoCode({super.key});

  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffFFFFFF),
      elevation: 1,
      // child: Container(
      //   width: double.infinity,
      //   height: 320,
      //
      //   decoration: BoxDecoration(
      //     // boxShadow: [
      //     //   BoxShadow(
      //     //     color: Colors.black45,
      //     //     spreadRadius: 0.1,
      //     //     blurRadius: 1,
      //     //   )
      //     // ],
      //     color: Color(0xffFFFFFF),
      //     borderRadius: BorderRadius.circular(10),
      //
      //   ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PcHeaderSection(),
          PcButton(),
          const PcContainerImage()
        ],
      ),
    );
  }
}
