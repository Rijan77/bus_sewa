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


}