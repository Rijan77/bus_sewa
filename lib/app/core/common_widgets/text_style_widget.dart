import 'package:flutter/material.dart';

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
    return const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: Colors.white
    );

  }

  static TextStyle flashSalesOffer(){
    return const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 18
    );
  }

  static TextStyle flashSlaesHotelName(){
    return const TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontSize: 15
    );
  }

  static TextStyle OfferTittle(){
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xff333333)
    );
  }

  static TextStyle OffersubTittle(){
    return TextStyle(
      fontSize: 12,
      color: Color(0xff7D7E83)
    );
  }

  static TextStyle blogHeading(){
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Color(0xff333333)
    );
  }
  
  static TextStyle blogDate(){
    return TextStyle(
      fontSize: 11,
      color: Color(0xff4A4A4A)
    );
  }

  static TextStyle blogDes(){
    return TextStyle(
      fontSize: 14,
      color: Color(0xff4A4A4A),

    );
  }


}