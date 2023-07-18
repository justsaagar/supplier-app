import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/routes/route_helper.dart';
import 'package:supplier/utils/utils.dart';

class VerifiedApplicationScreen extends StatefulWidget {
  const VerifiedApplicationScreen({super.key});

  @override
  State<VerifiedApplicationScreen> createState() => VerifiedApplicationScreenState();
}

class VerifiedApplicationScreenState extends State<VerifiedApplicationScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => Get.toNamed(RouteHelper.getDashboardRoute()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return Scaffold(
      body: SafeArea(
        child: AppImageAsset(
          image: AppAsset.verifiedApplication,
          height: Device.height,
          width: Device.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
