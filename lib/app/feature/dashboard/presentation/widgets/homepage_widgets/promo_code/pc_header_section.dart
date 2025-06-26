import 'package:flutter/material.dart';

class PcHeaderSection extends StatelessWidget {
  const PcHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Promo Codes",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xff4A4A4A)),
          ),
          const SizedBox(
            width: 160,
          ),
          InkWell(
              onTap: () {},
              child: const Text(
                "View All>>",
                style: TextStyle(fontSize: 14, color: Color(0xff445E91)),
              ))
        ],
      ),
    );
  }
}
