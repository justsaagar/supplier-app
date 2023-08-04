import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/dashboard_controller.dart';

class AppAppBar extends PreferredSize {
  final bool showSuffix;
  final bool showBack;
  final String title;

  AppAppBar({
    super.key,
    this.showBack = true,
    this.showSuffix = false,
    this.title = '',
  }) : super(child: Container(), preferredSize: Size.fromHeight(60.px));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColorConstant.lightBlue, AppColorConstant.darkBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: showBack ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            if (showBack)
              GestureDetector(
                onTap: () => Get.back(),
                child: AppImageAsset(
                  image: AppAsset.backIcon,
                  height: 15.px,
                  width: 15.px,
                  color: AppColorConstant.appWhite,
                ),
              ),
            if (showBack) const SizedBox(width: 15),
            AppText(
              title,
              fontWeight: FontWeight.w600,
              color: AppColorConstant.appWhite,
            ),
            if (showSuffix)
              GetBuilder<DashboardController>(builder: (logic) {
                return Positioned(
                  right: 28.px,
                  child: InkWell(
                    onTap: () => logic.scaffoldKey.currentState!.openDrawer(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppImageAsset(image: AppAsset.ordersIcon, height: 26.px, width: 26.px),
                        AppText('Orders', fontSize: 10.px, color: AppColorConstant.appWhite),
                      ],
                    ),
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }
}
