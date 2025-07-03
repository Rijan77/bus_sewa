
import 'package:bus_sewa/app/feature/dashboard/data/repositories/promocodes_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PcContainerImage extends StatelessWidget {
   PcContainerImage({super.key});

  PromocodesImplementation promocodesImplementation = PromocodesImplementation();


  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
        future: promocodesImplementation.getPromoCodes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 180,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Column(
                children: [
                  Icon(Icons.error, size: 50,),
                  Text("Error to fetch data")
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text("No PromoCodes Avilable");
          }

          final promoCode = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: promoCode.map((promoCode) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: _buildItem(
                        imageUrl: promoCode.imageUrl,
                        title: promoCode.title,
                        subTitle: promoCode.validDate,
                        promoType: promoCode.promoType,
                        buttonText: "Collect"),
                  );
                }).toList(),
              ),
            ),
          );
        });
  }

  Widget _buildItem(
      {required String imageUrl,
      required String title,
      required String subTitle,
        required String promoType,
      required String buttonText}) {
    return Container(
      height: 200.w,
      width: 200.w,
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
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Text(promoType, style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff333333)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                subTitle,
                style: const TextStyle(fontSize: 9, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 35,
            width: 170,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xff198B85),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
