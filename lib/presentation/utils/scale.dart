import 'package:flutter/material.dart';

class SizeConfig {
  late double screenWidth;
  late double screenHeight;

  void init(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width / 100;
    screenHeight = mediaQueryData.size.height / 100;
  }
}
