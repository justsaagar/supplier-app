import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';

class AppAppBar extends PreferredSize {
  final double appBarHeight;

  AppAppBar({super.key, required this.appBarHeight})
      : super(child: Container(), preferredSize: Size.fromHeight(appBarHeight));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: appBarHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColorConstant.lightBlue, AppColorConstant.darkBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const AppText(
              'Padyala Enterprises',
              fontWeight: FontWeight.w600,
              color: AppColorConstant.appWhite,
            ),
            Positioned(
              right: 28.px,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppImageAsset(image: AppAsset.ordersIcon, height: 26.px, width: 26.px),
                  AppText('Orders', fontSize: 10.px, color: AppColorConstant.appWhite),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
