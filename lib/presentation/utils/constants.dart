import 'package:flutter/material.dart';

class Style {
  static late MediaQueryData mediaQueryData;
  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
  }

  TextStyle kmediumstyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Pop',
      fontSize: mediaQueryData.size.height / 50);
  TextStyle kmediumstylebalck = TextStyle(
      color: Colors.black,
      fontFamily: 'Pop',
      fontSize: mediaQueryData.size.height / 50);
  TextStyle ksmallstyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Pop',
      fontSize: mediaQueryData.size.height / 55);
  TextStyle ksmallstyleblack = TextStyle(
      color: Colors.black,
      fontFamily: 'Pop',
      fontSize: mediaQueryData.size.height / 55);
}

const kPrimarycolor = Color.fromARGB(255, 244, 139, 54);
const kSecondarycolor = Color.fromARGB(245, 220, 176, 1);
const kTetiarycolor = Color.fromARGB(19, 25, 25, 1);
const kbackgroundcolor = Color.fromARGB(255, 245, 220, 176);
