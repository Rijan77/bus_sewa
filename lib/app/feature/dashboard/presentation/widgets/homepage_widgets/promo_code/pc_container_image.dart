import 'package:bus_sewa/app/feature/dashboard/domain/entities/mock_promo_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PcContainerImage extends StatelessWidget {
  const PcContainerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MockPromoCodes.fetchPromoCodes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 180,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Error Loading PromoCode");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text("No PromoCodes Avilable");
          }

          final promoCode = snapshot.data!;

          return Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: promoCode.map((promoCode) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: _buildItem(
                        imageUrl: promoCode.imageUrl,
                        title: promoCode.title,
                        subTitle: promoCode.subTitle,
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
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
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
              color: Color(0xff198B85),
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
