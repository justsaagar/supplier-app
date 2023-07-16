import 'package:flutter/material.dart';

class AppColorConstant {
  static const Color appScaffold = Color(0xFFD8D6D9);
  static const Color appTransparent = Color(0x00000000);
  static const Color appWhite = Color(0xffFFFFFF);
  static const Color appCream = Color(0xffFFF0BB);
  static const Color appBlack = Color(0xFF000000);
  static const Color lightBlue = Color(0xFF2F394B);
  static const Color darkBlue = Color(0xFF080D18);
  static const Color lightWhite = Color(0xFFF2F2F2);
  static const Color itemBgColor = Color(0xffFCFAFF);
  static const Color lightGreyColor = Color(0xffC9C7C7);
  static const Color greyColor = Color(0xffACACAC);
  static const Color appTomatoRed = Color(0xFFFF0000);
  static const Color appRed = Color(0xFFC62828);
  static const Color appYellow = Color(0xFFFD8C20);
  static const Color appGreen = Color(0xFF53B97C);
  static const Color appGrey = Color(0xFF838383);

  static Color hex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static List<BoxShadow> appBoxShadow = [
    BoxShadow(offset: const Offset(0, 3), spreadRadius: 0.2, color: lightBlue.withOpacity(0.2), blurRadius: 2),
  ];

  static List<BoxShadow> appDarkBoxShadow = [
    BoxShadow(offset: const Offset(0, 3), spreadRadius: 0.2, color: appWhite.withOpacity(0.2), blurRadius: 2),
  ];
}
