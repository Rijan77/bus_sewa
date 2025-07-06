import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyleWidget{

  static TextStyle titleTextStyle(){
    return const TextStyle(
      color: Color(0xff4A4A4A),
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle subTitleTextStyle(){
    return const TextStyle(
        fontSize: 14, color: Color(0xff445E91)
    );
  }

  static TextStyle flashSlaesTime(){
    return  TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white
    );

  }

  static TextStyle flashSalesOffer(){
    return  TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 13.sp
    );
  }

  static TextStyle flashSlaesHotelName(){
    return  TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontSize: 11.sp
    );
  }

  static TextStyle OfferTittle(){
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xff333333)
    );
  }

  static TextStyle OffersubTittle(){
    return const TextStyle(
      fontSize: 12,
      color: Color(0xff7D7E83)
    );
  }

  static TextStyle blogHeading(){
    return const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Color(0xff333333)
    );
  }
  
  static TextStyle blogDate(){
    return const TextStyle(
      fontSize: 11,
      color: Color(0xff4A4A4A)
    );
  }

  static TextStyle blogDes(){
    return const TextStyle(
      fontSize: 14,
      color: Color(0xff4A4A4A),

    );


  }


}