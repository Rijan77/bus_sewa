import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopHeader extends SliverPersistentHeaderDelegate {
  final List<HeaderItem> items;

  const TopHeader({required this.items});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(), // Disable scroll here
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of columns
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          elevation: 5,
          color: const Color(0xffFFFFFF),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 130;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}

class HeaderItem {
  final SvgPicture image;
  final String label;

  HeaderItem({required this.image, required this.label});
}
