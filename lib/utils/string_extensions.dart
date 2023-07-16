import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';


extension SnackBar on String {
  showError() {
    Get.snackbar(
      'Failed!!',
      this,
      backgroundColor: AppColorConstant.appRed,
      colorText: AppColorConstant.appWhite,
    );
  }

  showSuccess() {
    Get.snackbar(
      'Success!!',
      this,
      backgroundColor: AppColorConstant.appGreen,
      colorText: AppColorConstant.appWhite,
    );
  }

  shareLink() => Share.share(this);

  copyCode() {
    Clipboard.setData(ClipboardData(text: this));
    '$this code copied'.showSuccess();
  }

  launchLink(BuildContext context, {LaunchMode? mode}) async {
    try {
      if (await canLaunchUrl(Uri.parse(this))) {
        await launchUrl(Uri.parse(this), mode: mode ?? LaunchMode.externalApplication);
      } else {
        Future.delayed(const Duration(microseconds: 1), () => 'somethingWentWrong'.tr);
      }
    } catch (e) {
      logs('Catch exception in launchLink --> $e');
    }
  }
}

extension StringCasingExtension on String {
  String stringAsFixed({int? fixValue}) => padLeft(fixValue ?? 2, '0');
}
