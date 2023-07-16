import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/plumster_asset.dart';

class AppLoader extends StatelessWidget {
  final Color loaderColor;
  final double loaderSize;

  const AppLoader({super.key, this.loaderColor = AppColorConstant.appWhite, this.loaderSize = 120});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: AppColorConstant.appWhite.withOpacity(0.6),
      child: AppImageAsset(image: AppAsset.loaderAnimation, height: loaderSize.px, width: loaderSize.px),
    );
  }
}
