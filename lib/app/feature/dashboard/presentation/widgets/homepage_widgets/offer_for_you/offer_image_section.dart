import 'package:bus_sewa/app/core/common_widgets/text_style_widget.dart';
// import 'package:bus_sewa/app/feature/dashboard/data/repositories/mock_offer_service%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/offers_models/offers_items.dart';
import '../../../../data/repositories/mock_offer_implementation .dart';

class OfferImageSection extends StatelessWidget {
   OfferImageSection({super.key});

   final offerService = MockOfferService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OfferModel>>(
        future: offerService.fetchOffers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 180,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return const Text("Error loading offers");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text("No offers available");
          }
          final offers = snapshot.data!;
          final limitedData = offers.take(5).toList();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: limitedData.map((offers) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: _buildCard(
                        imageUrl: offers.imageUrl,
                        offerType: _buildOfferType(offers.offerType),
                        title: offers.title,
                        subTitle: offers.subTitle),
                  );
                }).toList(),
              ),
            ),
          );
        });

    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: SingleChildScrollView(
    //     scrollDirection: Axis.horizontal,
    //     child: Row(
    //       children: [
    //         // for(int i=0; i<=5; i++)...{
    //         //
    //         // },
    //         _buildCard(
    //             imageUrl:
    //                 "https://i.pinimg.com/736x/65/20/94/652094e35710c83914f433fc04579f9b.jpg",
    //             offerType: Container(
    //               height: 20,
    //               width: 70,
    //               decoration: BoxDecoration(
    //                   color: Colors.yellow.shade50,
    //                   borderRadius: BorderRadius.circular(30)),
    //               child: const Center(
    //                 child: Text(
    //                   "Rental",
    //                   style: TextStyle(color: Colors.orangeAccent),
    //                 ),
    //               ),
    //             ),
    //             title: "Black Friday Deals!",
    //             subTitle: "Valid Till: 5 Dec 2024"),
    //         const SizedBox(width: 10),
    //         _buildCard(
    //             imageUrl:
    //                 "https://i.pinimg.com/736x/49/f4/0d/49f40d48ee9372e7e6ebcd312b2ce6c5.jpg",
    //             offerType: Container(
    //               height: 20,
    //               width: 70,
    //               decoration: BoxDecoration(
    //                   color: Colors.blue.shade50,
    //                   borderRadius: BorderRadius.circular(30)),
    //               child: const Center(
    //                 child: Text(
    //                   "Flights",
    //                   style: TextStyle(color: Colors.blue),
    //                 ),
    //               ),
    //             ),
    //             title: "Everest Flight",
    //             subTitle: "Valid Till: 5 Dec 2024"),
    //         const SizedBox(width: 10),
    //         _buildCard(
    //             imageUrl:
    //                 "https://i.pinimg.com/736x/35/4a/aa/354aaa6985aa4fdc198dc30145e6023a.jpg",
    //             offerType: Container(
    //               height: 20,
    //               width: 70,
    //               decoration: BoxDecoration(
    //                   color: Colors.yellow.shade50,
    //                   borderRadius: BorderRadius.circular(30)),
    //               child: const Center(
    //                 child: Text(
    //                   "Rental",
    //                   style: TextStyle(color: Colors.orangeAccent),
    //                 ),
    //               ),
    //             ),
    //             title: "Black Friday Deals!",
    //             subTitle: "Valid Till: 5 Dec 2024"),
    //       ],
    //     ),
    //   ),
    // );
  }

  Container _buildOfferType(String type) {
    return Container(
      height: 16.sp,
      width: 53.sp,
      decoration: BoxDecoration(
        color: Colors.orange.shade50, // ✅ same background color for all
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Center(
        child: Text(
          type,
          style:  TextStyle(
            fontSize: 10.sp,
            color: Colors.orangeAccent, // ✅ same text color for all
            fontWeight: FontWeight.w500,
          ),
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
        height: 145.sp,
        width: 180.sp,
        decoration: const BoxDecoration(
          color: Color(0xffF9F9FF),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 87.sp,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.broken_image));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130, top: 10),
                  child: Container(child: offerType),
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
