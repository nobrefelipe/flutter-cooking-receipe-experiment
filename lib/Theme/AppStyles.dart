import 'package:flutter/material.dart';

class AppStyles {

  static const Color primaryColor = Color.fromRGBO(251, 120, 95, 1);
  static const Color primaryColor_Alpha = Color.fromRGBO(251, 120, 95, 0.6);
  static const Color textColor = Color.fromRGBO(2, 34, 65, 1);
  static const Color textColorAlpha = Color.fromRGBO(2, 34, 65, 0.8);
  static const Color flatPink = Color.fromRGBO(249, 209, 202, 1);
  static const Color flatBlue = Color.fromRGBO(222, 232, 254, 1);

  static const TextStyle h1 = TextStyle(
    fontFamily: 'NotoSerif',
    color: textColor,
    fontSize: 38,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1
  );

  static const TextStyle h1_bold = TextStyle(
    fontFamily: 'NotoSerif',
    color: textColor,
    fontSize: 38,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.1
  );


  static const TextStyle h2 = TextStyle(
    fontFamily: 'NotoSerif',
    color: textColor,
    fontSize: 28,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1
  );

  static const TextStyle h2_bold = TextStyle(
    fontFamily: 'NotoSerif',
    color: textColor,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.1
  );

  static const TextStyle h6 = TextStyle(
    fontFamily: 'firasans',
    color: textColorAlpha,
    fontSize: 14,
    fontWeight: FontWeight.normal
  );


  static const TextStyle h6_bold = TextStyle(
    fontFamily: 'firasans',
    color: textColor,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.1
  );

  static const TextStyle bodyFont = TextStyle(
    fontFamily: 'firasans',
    color: textColorAlpha,
    fontSize: 14,
    height: 1.3,
    fontWeight: FontWeight.normal
  );

}