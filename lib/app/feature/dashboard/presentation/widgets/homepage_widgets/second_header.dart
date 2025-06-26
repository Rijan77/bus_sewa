import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondHeader extends StatelessWidget {
  final List<SecondHeaderItem> items;

  const SecondHeader({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final firstRowItems = items.length > 5 ? items.sublist(0, 5) : items;
    final secondRowItems = items.length > 5 ? items.sublist(5) : [];

    Widget buildItem(SecondHeaderItem item) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 40, width: 40, child: item.image),
          const SizedBox(height: 10),
          Text(
            item.label,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 2,
        color: const Color(0xffFFFFFF),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Wrap(
                spacing: 30,
                runSpacing: 20,
                children: firstRowItems.map(buildItem).toList(),
              ),
              if (secondRowItems.isNotEmpty) ...[
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: secondRowItems
                      .map((item) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: buildItem(item),
                          ))
                      .toList(),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class SecondHeaderItem {
  final SvgPicture image;
  final String label;

  SecondHeaderItem({required this.image, required this.label});
}
