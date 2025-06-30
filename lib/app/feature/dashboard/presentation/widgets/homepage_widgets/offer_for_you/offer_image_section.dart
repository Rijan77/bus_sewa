import 'package:bus_sewa/app/core/common_widgets/text_style_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class OfferImageSection extends StatelessWidget {
  const OfferImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildCard(
                imageUrl:
                    "https://i.pinimg.com/736x/65/20/94/652094e35710c83914f433fc04579f9b.jpg",
                offerType: Container(
                  height: 20,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.yellow.shade50,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Rental",
                      style: TextStyle(color: Colors.orangeAccent),
                    ),
                  ),
                ),
                title: "Black Friday Deals!",
                subTitle: "Valid Till: 5 Dec 2024"),
            SizedBox(width: 10),
            _buildCard(
                imageUrl:
                    "https://i.pinimg.com/736x/49/f4/0d/49f40d48ee9372e7e6ebcd312b2ce6c5.jpg",
                offerType: Container(
                  height: 20,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Flights",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                title: "Everest Flight",
                subTitle: "Valid Till: 5 Dec 2024"),
            SizedBox(width: 10),
            _buildCard(
                imageUrl:
                    "https://i.pinimg.com/736x/35/4a/aa/354aaa6985aa4fdc198dc30145e6023a.jpg",
                offerType: Container(
                  height: 20,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.yellow.shade50,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Rental",
                      style: TextStyle(color: Colors.orangeAccent),
                    ),
                  ),
                ),
                title: "Black Friday Deals!",
                subTitle: "Valid Till: 5 Dec 2024"),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      {required String imageUrl,
      required Container offerType,
      required String title,
      required String subTitle}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 180,
        width: 210,
        decoration: BoxDecoration(
          color: Color(0xffF9F9FF),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Icon(Icons.broken_image));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 130, top: 10),
                    child: Container(child: offerType),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: TextStyleWidget.OfferTittle(),
                    ),
                    Text(
                      subTitle,
                      style: TextStyleWidget.OffersubTittle(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
