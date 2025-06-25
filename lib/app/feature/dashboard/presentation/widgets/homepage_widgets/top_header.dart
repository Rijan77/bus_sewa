// header_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class TopHeaderWidget extends StatelessWidget {
  final List<HeaderItem> items;

  const TopHeaderWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          elevation: 4,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40, width: 40, child: item.image),
              const SizedBox(height: 8),
              Text(item.label, style: const TextStyle(fontSize: 12)),
            ],
          ),
        );
      },
    );
  }
}


class HeaderItem {
  final SvgPicture image;
  final String label;

  HeaderItem({required this.image, required this.label});
}

