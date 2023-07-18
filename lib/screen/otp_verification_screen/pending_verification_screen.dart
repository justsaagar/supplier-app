import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/utils/utils.dart';

class PendingVerificationScreen extends StatelessWidget {
  const PendingVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return Scaffold(
      body: Stack(
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
          SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 28.px),
              children: [
                SizedBox(height: 22.px),
                Align(alignment: Alignment.centerLeft, child: AppImageAsset(image: AppAsset.backIcon, height: 18.px)),
                SizedBox(height: 80.px),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.px),
                  child: const AppText(
                    'Use the below details to login and check your status',
                    color: AppColorConstant.appWhite,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 14.px),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.px),
                  child: const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText('Email'),
                          AppText('Password'),
                        ],
                      ),
                      Column(
                        children: [
                          AppText(' : '),
                          AppText(' : '),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText('email will be here', color: AppColorConstant.appOrange, fontWeight: FontWeight.w500),
                          AppText('Password will be here', color: AppColorConstant.appOrange, fontWeight: FontWeight.w500,),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.px),
                AppImageAsset(image: AppAsset.processApplication, height: 224.px, width: 224.px),
                SizedBox(height: 40.px),
                AppText('Your application is under verification please try later', fontSize: 16.px, textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
