import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/app_asset.dart';

class AppNoInternetAlert extends StatelessWidget {
  const AppNoInternetAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.px),
      backgroundColor: AppColorConstant.appWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.px)),
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: Device.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50.px,
              width: 100.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColorConstant.lightBlue,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.px),
                    topLeft: Radius.circular(8.px)),
              ),
              child: AppText(
                'Internet Issue',
                textAlign: TextAlign.center,
                fontSize: 16.px,
                color: AppColorConstant.appWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.px),
            Lottie.asset(AppAsset.noInternetAnimation, height: 200.px),
            SizedBox(height: 20.px),
          ],
        ),
      ),
    );
  }
}
