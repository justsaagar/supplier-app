import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/app_asset.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? length;
  final String hintText;
  final String headerTitle;
  final bool readOnly;
  final bool obscureText;
  final bool isNumber;
  final bool isLightMode;
  final bool isBorder;
  final Color? filedColor;

  const AppTextFormField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onTap,
    this.keyboardType,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.length,
    required this.hintText,
    required this.headerTitle,
    this.readOnly = false,
    this.obscureText = false,
    this.isNumber = false,
    this.isBorder = false,
    this.isLightMode = false,
    this.filedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(headerTitle.isNotEmpty)AppText(
          headerTitle,
          fontSize: 14.px,
          fontWeight: FontWeight.w500,
          color: isLightMode ? AppColorConstant.appWhite : AppColorConstant.appBlack,
        ),
        if(headerTitle.isNotEmpty)SizedBox(height: 4.px),
        Container(
          height: 45.px,
          padding: EdgeInsets.only(left: prefixIcon == null ? 26.px : 0.px),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.px),
            border: isBorder ? Border.all(color: AppColorConstant.appGrey.withOpacity(0.5)) : null,
            color: filedColor ?? AppColorConstant.lightGreyColor.withOpacity(0.19),
          ),
          child: Row(
            children: [
              if (prefixIcon != null) SizedBox(width: 60.px, child: prefixIcon),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  onTap: onTap,
                  onChanged: onChanged,
                  style: TextStyle(
                    fontFamily: AppAsset.defaultFont,
                    fontSize: 14.px,
                    fontWeight: FontWeight.w400,
                    color: AppColorConstant.appWhite,
                  ),
                  readOnly: readOnly,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters ??
                      [
                        FilteringTextInputFormatter.deny(RegExp('^\\s')),
                        if (isNumber) FilteringTextInputFormatter.digitsOnly,
                        if (isNumber) LengthLimitingTextInputFormatter(length),
                      ],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontFamily: AppAsset.defaultFont,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w400,
                      color: AppColorConstant.lightGreyColor,
                    ),
                  ),
                ),
              ),
              if (suffixIcon != null) Padding(padding: EdgeInsets.only(right: 12.px), child: suffixIcon!),
            ],
          ),
        ),
      ],
    );
  }
}

class VerticalTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? length;
  final num height;
  final String hintText;
  final String headerTitle;
  final bool readOnly;
  final bool obscureText;
  final bool isNumber;
  final bool isLightMode;
  final bool isBorder;
  final Color? filedColor;

  const VerticalTextFormField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onTap,
    this.keyboardType,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.length,
    this.height = 35,
    required this.hintText,
    required this.headerTitle,
    this.readOnly = false,
    this.obscureText = false,
    this.isNumber = false,
    this.isBorder = false,
    this.isLightMode = false,
    this.filedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (headerTitle.isNotEmpty) AppText(headerTitle, color: AppColorConstant.appHintGrey),
        if (headerTitle.isNotEmpty) SizedBox(width: 6.px),
        Expanded(
          child: Container(
            height: height.px,
            padding: EdgeInsets.only(left: 4.px),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.px),
              border: isBorder ? Border.all(color: AppColorConstant.appGrey.withOpacity(0.5)) : null,
              color: filedColor ?? AppColorConstant.lightGreyColor.withOpacity(0.19),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    onTap: onTap,
                    onChanged: onChanged,
                    style: TextStyle(
                      fontFamily: AppAsset.defaultFont,
                      fontSize: 10.px,
                      fontWeight: FontWeight.w400,
                      color: AppColorConstant.appBluest,
                    ),
                    readOnly: readOnly,
                    obscureText: obscureText,
                    keyboardType: keyboardType,
                    inputFormatters: inputFormatters ??
                        [
                          FilteringTextInputFormatter.deny(RegExp('^\\s')),
                          if (isNumber) FilteringTextInputFormatter.digitsOnly,
                          if (isNumber) LengthLimitingTextInputFormatter(length),
                        ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        fontFamily: AppAsset.defaultFont,
                        fontSize: 14.px,
                        fontWeight: FontWeight.w400,
                        color: AppColorConstant.lightGreyColor,
                      ),
                    ),
                  ),
                ),
                const Icon(Icons.calendar_month, color: AppColorConstant.appHintGrey),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
