import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/utils/date_utils.dart';
import 'package:supplier/utils/utils.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          AppImageAsset(image: AppAsset.notificationsIcon,height: 176.px, width: 176.px),
          SizedBox(height: 12.px),
          AppText(
            'You have no\nNotifications',
            fontSize: 24.px,
            color: AppColorConstant.appGrey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Container buildNotificationCard(String titleText) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.px, horizontal: 20.px),
        decoration: const BoxDecoration(color: AppColorConstant.appWhite),
        child: Column(
          children: [
            AppText(titleText, color: const Color(0xFF555555)),
            SizedBox(height: 18.px),
            Row(
              children: [
                AppText(
                  DateTimeUtils.getNotificationTime(DateTime.now()),
                  color: const Color(0xFF555555),
                  fontSize: 10.px,
                )
              ],
            )
          ],
        ),
      );
  }
}
