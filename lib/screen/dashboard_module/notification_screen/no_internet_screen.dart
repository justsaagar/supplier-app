import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/utils/utils.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          AppImageAsset(image: AppAsset.noInternetIcon, height: 176.px, width: 176.px),
          SizedBox(height: 12.px),
          AppText(
            'Oops!\nNo internet\nConnection',
            fontSize: 24.px,
            color: AppColorConstant.appGrey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
