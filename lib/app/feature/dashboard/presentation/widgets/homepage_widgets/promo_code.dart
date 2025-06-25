import 'package:flutter/material.dart';

class PromoCode extends StatefulWidget {
  final List<PromoCodeHeader> items;

  const PromoCode({super.key, required this.items});

  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Card(
        elevation: 5,
        color: const Color(0xffFFFFFF),
        child: Column(
          children: widget.items.map((item) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                              color: Color(0xff4A4A4A),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: Text(
                            item.secondTitle,
                            style: const TextStyle(color: Color(0xff1A4C9A)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: item.button),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class PromoCodeHeader {
  final String title;
  final String secondTitle;
  final List<ElevatedButton> button;

  PromoCodeHeader({
    required this.title,
    required this.secondTitle,
    required this.button,
  });
}
