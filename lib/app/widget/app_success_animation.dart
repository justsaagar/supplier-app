import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/app_asset.dart';

class AppSuccessAlert extends StatelessWidget {
  const AppSuccessAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.px),
      backgroundColor: AppColorConstant.appWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.px)),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppAsset.greenTickAnimation, height: 180.px),
          AppText(
            'Request Sent Successfully',
            textAlign: TextAlign.center,
            fontSize: 16.px,
            color: AppColorConstant.appBlack,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 30.px),
        ],
      ),
    );
  }
}
