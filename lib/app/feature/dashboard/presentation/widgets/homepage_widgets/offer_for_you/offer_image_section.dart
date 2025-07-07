import 'package:bus_sewa/app/core/common_widgets/text_style_widget.dart';
import 'package:bus_sewa/app/core/utils/api_status.dart';
import 'package:bus_sewa/app/feature/dashboard/presentation/blocs/offers/offers_cubit.dart';

// import 'package:bus_sewa/app/feature/dashboard/data/repositories/mock_offer_service%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/repositories/mock_offer_implementation .dart';

class OfferImageSection extends StatefulWidget {
  final selectedType;

  const OfferImageSection({super.key, required this.selectedType});

  @override
  State<OfferImageSection> createState() => _OfferImageSectionState();
}

class _OfferImageSectionState extends State<OfferImageSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<OffersCubit>().fetchOffers();
  }

  final offerService = MockOfferService();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(builder: (context, state) {
      if (state.offerStatus == ApiStatus.initial ||
          state.offerStatus == ApiStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state.offerStatus == ApiStatus.failure) {
        return const Center(
          child: Text("Error to Fetch Offers Data"),
        );
      } else if (state.offerStatus == ApiStatus.success) {
        final wOfferData = state.getOfferModel;

        final Map<String, dynamic> shortOffer = {
          'Reservation': "Rental",
          'Tours': "Flights",
          "Bus": "BusSewa"
        };

        final filterOffer = widget.selectedType == "All"
            ? wOfferData
            : wOfferData.where(
                (items) => items.offerType == shortOffer[widget.selectedType]);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filterOffer.map((offers) {
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
      }
      return const SizedBox.shrink();
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

  Container _buildOfferType(String offerType) {
    Color backgroundColor;
    Color textColor;
    //
    // if (offerType == 'Rental') {
    //   backgroundColor = Colors.orange.shade50;
    //   textColor = Colors.orangeAccent;
    // } else if (offerType == 'Flights') {
    //   backgroundColor = Colors.blue.shade50;
    //   textColor = Colors.blue;
    // } else {
    //   backgroundColor = Colors.grey.shade200;
    //   textColor = Colors.black54;
    // }

    switch (offerType) {
      case "Rental":
        backgroundColor = Colors.orange.shade50;
        textColor = Colors.orangeAccent;
        break;

      case "Flights":
        backgroundColor = Colors.blue.shade50;
        textColor = Colors.blue;
        break;

      default:
        backgroundColor = Colors.red.shade100;
        textColor = Colors.white;
    }

    return Container(
      height: 16.sp,
      width: 53.sp,
      decoration: BoxDecoration(
        // color: offerType == "Rental"? Colors.orange.shade50: Colors.blue.shade50,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: Center(
        child: Text(
          offerType,
          style: TextStyle(
            fontSize: 10.sp,
            // color: offerType == "Rental"? Colors.orangeAccent: Colors.blue,
            color: textColor,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyleWidget.OfferTittle(),
                  ),
                  Text(
                    subTitle,
                    style: TextStyleWidget.OffersubTittle(),
                  ),
                  8.verticalSpace
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
