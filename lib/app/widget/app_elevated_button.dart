import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final String buttonName;
  final double? fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  final double? buttonRadius;
  final Color buttonColor;
  final Color borderColor;
  final double? buttonHeight;
  final double buttonWidth;
  final bool isBorderShape;
  final bool isIconShow;
  final String? imageString;

  const AppElevatedButton({
    Key? key,
    this.onPressed,
    this.padding = EdgeInsets.zero,
    required this.buttonName,
    this.fontSize,
    this.fontWeight = FontWeight.w600,
    this.fontColor = AppColorConstant.appWhite,
    this.buttonRadius,
    this.buttonColor = AppColorConstant.appYellow,
    this.borderColor = AppColorConstant.appOrange,
    this.buttonHeight,
    this.buttonWidth = double.infinity,
    this.isBorderShape = false,
    this.isIconShow = false,
    this.imageString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(buttonWidth, buttonHeight ?? 43.px)),
          backgroundColor: MaterialStateProperty.all(isBorderShape ? AppColorConstant.appWhite : buttonColor),
          shape: isBorderShape
              ? MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius ?? 8.px),
                    side: BorderSide(color: borderColor),
                  ),
                )
              : MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonRadius ?? 5.px)),
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(isIconShow) AppImageAsset(image: imageString ??''),
            if(isIconShow)const SizedBox(width: 12),
            AppText(
              buttonName,
              fontSize: fontSize,
              color: isBorderShape ? buttonColor : fontColor,
              fontWeight: fontWeight,
            ),
          ],
        ),
      ),
    );
  }
}
