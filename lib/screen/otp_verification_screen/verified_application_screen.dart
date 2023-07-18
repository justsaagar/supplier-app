import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/utils/utils.dart';

class VerifiedApplicationScreen extends StatelessWidget {
  const VerifiedApplicationScreen({super.key});

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
