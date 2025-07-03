import 'package:bus_sewa/app/feature/dashboard/presentation/widgets/homepage_widgets/recent_seraches/rs_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentSearch extends StatelessWidget {
  const RecentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 117.sp,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text(
                "Recent Searches",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4A4A4A)),
              ),
            ),
            const SizedBox(height: 5),

            RsLocation()

          ],
        ),
      ),
    );
  }
}
