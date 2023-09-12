import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/app_asset.dart';

class AppLoader extends StatelessWidget {
  final Color loaderColor;
  final double loaderSize;

  const AppLoader({super.key, this.loaderColor = AppColorConstant.appWhite, this.loaderSize = 500});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: AppColorConstant.appWhite.withOpacity(0.6),
      child: Lottie.asset(AppAsset.loaderAnimation, height: loaderSize.px, width: loaderSize.px),
    );
  }
}
