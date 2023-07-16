import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_store/open_store.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';

appForceUpdateDialog() {
  Get.defaultDialog(
    title: '',
    titlePadding: EdgeInsets.zero,
    barrierDismissible: false,
    radius: 14.px,
    onWillPop: () async => false,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(
          "Update required",
          fontSize: 14.px,
          color: AppColorConstant.lightBlue,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 10.px),
        AppText(
          'Please download the latest app for a seamless experience',
          fontSize: 12.px,
          color: AppColorConstant.appBlack.withOpacity(0.6),
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15.px),
      ],
    ),
    actions: [
      InkWell(
        onTap: () {
          OpenStore.instance.open(
            /// TODO : Change with appStoreId
            appStoreId: 'PlumStringConstants.iOSAppId',
            androidAppBundleId: 'com.acintyo.localSupplier',
          );
        },
        child: Container(
          height: 38.px,
          margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 5.w),
          padding: EdgeInsets.only(left: 2.w, right: 2.w),
          decoration: BoxDecoration(color: AppColorConstant.appGreen, borderRadius: BorderRadius.circular(7)),
          child: Center(
            child: AppText(
              'Update now',
              maxLines: 1,
              fontSize: 14.px,
              color: AppColorConstant.appWhite,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      )
    ],
  );
}
