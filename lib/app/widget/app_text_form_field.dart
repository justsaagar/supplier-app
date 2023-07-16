import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/plumster_asset.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? length;
  final String hintText;
  final bool readOnly;
  final bool obscureText;
  final bool isNumber;

  const AppTextFormField({
    super.key,
    required this.controller,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.length,
    required this.hintText,
    this.readOnly = false,
    this.obscureText = false,
    this.isNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.px,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.px),
        color: AppColorConstant.lightGreyColor,
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(
          fontFamily: AppAsset.defaultFont,
          fontSize: 14.px,
          fontWeight: FontWeight.w600,
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
            fontWeight: FontWeight.w600,
            color: AppColorConstant.lightGreyColor,
          ),
        ),
      ),
    );
  }
}
