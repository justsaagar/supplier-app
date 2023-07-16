import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/plumster_asset.dart';
import 'package:supplier/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: Device.height,
            width: Device.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColorConstant.lightBlue, AppColorConstant.darkBlue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          AppImageAsset(image: AppAsset.splashLogoImage, height: 130.px, width: Device.width * 0.76),
        ],
      ),
    );
  }
}
