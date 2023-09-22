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
  static const Color appOrange = Color(0xFFFB700D);
  static const Color appGreen = Color(0xFF1EAA24);
  static const Color appGrey = Color(0xFF838383);
  static const Color appBluest = Color(0xFF2D3648);
  static const Color appDarkBlue = Color(0xFF0A074C);
  static const Color appBottomBarGrey = Color(0xFFAAA8A8);
  static const Color appLightWhite = Color(0xffECF0F3);
  static const Color appChartBlue = Color(0xff5388D8);
  static const Color appChartRed = Color(0xffD13333);
  static const Color appChartYellow = Color(0xffF4BE37);
  static const Color appChartPurple = Color(0xff8812D0);
  static const Color appChartDarkBlue= Color(0xff151BB5);
  static const Color appChartLightBlue= Color(0xff29B6C9);
  static const Color appChartPink= Color(0xffBD07B6);
  static const Color appChartGreen= Color(0xff1EAA24);
  static const Color appHintGrey= Color(0xff8B8888);
  static const Color semiGreyColor = Color(0xffC4C4C4);
  static const Color primaryColor = Color(0xffFF8A00);
  static const Color greyBgColor = Color(0xffF3F3F3);
  static const Color textBlackColor = Color(0xff404040);
  static const Color dividerColor = Color(0xffE5E5E5);
  static const Color borderColor = Color(0xff949292);

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

  static BoxDecoration boxDecoration = BoxDecoration(
    color: AppColorConstant.appWhite,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: AppColorConstant.appGrey.withOpacity(0.3),
        blurRadius: 4,
        offset: const Offset(0, 0),
      ),
    ],
  );

  static List<Color> appGradientColor = const [
    Color(0xff2E384A),
    Color(0xff0B111D)
  ];
}
