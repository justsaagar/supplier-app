import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final String buttonName;
  final double? fontSize;
  final Color fontColor;
  final double? buttonRadius;
  final Color buttonColor;
  final double? buttonHeight;
  final double buttonWidth;
  final bool isBorderShape;

  const AppElevatedButton({
    Key? key,
    this.onPressed,
    this.padding = EdgeInsets.zero,
    required this.buttonName,
    this.fontSize,
    this.fontColor = AppColorConstant.appWhite,
    this.buttonRadius,
    this.buttonColor = AppColorConstant.appYellow,
    this.buttonHeight,
    this.buttonWidth = double.infinity,
    this.isBorderShape = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(buttonWidth, buttonHeight ?? 48.px)),
          backgroundColor: MaterialStateProperty.all(isBorderShape ? AppColorConstant.appWhite : buttonColor),
          shape: isBorderShape
              ? MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius ?? 8.px),
                    side: BorderSide(color: buttonColor),
                  ),
                )
              : MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonRadius ?? 5.px)),
                ),
        ),
        child: AppText(
          buttonName,
          fontSize: fontSize,
          color: isBorderShape ? buttonColor : fontColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
