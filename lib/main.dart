import 'package:bus_sewa/app/feature/dashboard/presentation/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}
