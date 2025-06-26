import 'package:flutter/material.dart';

class PcHeaderSection extends StatelessWidget {
  const PcHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Promo Codes", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff4A4A4A)),),
          SizedBox(width: 170,),
          Text("View All >>")
        ],
      ),
    );
  }
}
