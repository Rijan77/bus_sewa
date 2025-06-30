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
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: Colors.white
    );

  }

  static TextStyle flashSalesOffer(){
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 18
    );
  }

  static TextStyle flashSlaesHotelName(){
    return TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontSize: 15
    );
  }


}