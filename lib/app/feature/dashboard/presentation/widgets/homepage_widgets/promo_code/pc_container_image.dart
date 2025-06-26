import 'package:flutter/material.dart';

class PcContainerImage extends StatelessWidget {
  final List<PcContainerImageItem> items;

  const PcContainerImage({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    Widget buildItem(PcContainerImageItem item) {
      return Container(
        height: 200,
        width: 200,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: item.imageColor ?? Colors.red,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: item.image,
            ),
            const SizedBox(height: 8),
            Text(
              item.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff333333)),
            ),
            Text(
              item.subtitle,
              style: const TextStyle(fontSize: 9, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Container(
              height: 35,
              width: 170,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: item.buttonColor ?? Color(0xff198B85),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                item.buttonText,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      );
    }

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: items.map(buildItem).toList(),
    );
  }
}

class PcContainerImageItem {
  final Widget image;
  final String title;
  final String subtitle;
  final String buttonText;
  final Color? imageColor;
  final Color? buttonColor;

  PcContainerImageItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.imageColor,
    this.buttonColor,
  });
}
