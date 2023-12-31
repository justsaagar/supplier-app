import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/constant/color_constant.dart';

class AppText extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign? textAlign;
  final double? height;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? decoration;
  final double? letterSpacing;

  const AppText(
    this.title, {
    Key? key,
    this.color,
    this.fontWeight,
    this.fontFamily,
    this.fontSize,
    this.textAlign,
    this.height,
    this.fontStyle,
    this.maxLines,
    this.overflow,
    this.decoration = TextDecoration.none,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        color: color ?? AppColorConstant.appBlack,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize ?? 14.px,
        height: height,
        fontStyle: fontStyle,
        overflow: overflow,
        decoration: decoration,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
class AppHeaderText extends StatelessWidget {
  final String headerText;
  final Color headerColor;

  const AppHeaderText(
      {Key? key, required this.headerText, required this.headerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      child: AppText(
        headerText,
        color: headerColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}