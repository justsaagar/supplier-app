import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';

class AppErrorText extends StatelessWidget {
  final String errorText;

  const AppErrorText({Key? key, required this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.px),
      child: AppText(
        errorText,
        color: AppColorConstant.appRed,
        fontSize: 14.px,
        fontWeight: FontWeight.w400,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
