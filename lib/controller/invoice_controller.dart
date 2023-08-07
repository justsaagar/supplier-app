import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/utils/date_format_service.dart';

class InVoiceController extends GetxController {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  DateTime fromDate = DateTime.now().subtract(const Duration(days: 6570));
  DateTime toDate = DateTime.now().subtract(const Duration(days: 6570));

  Future<void> selectDate(BuildContext context,DateTime dateTime,TextEditingController dateController) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 100, 1),
      lastDate: DateTime.now().subtract(const Duration(days: 6570)),
      initialDate: dateTime,
      helpText: 'Date',
      confirmText: 'Okay',
      cancelText: 'Cancel',
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: AppColorConstant.appWhite,
            colorScheme: const ColorScheme.light(
              primary: AppColorConstant.appBluest,
              onSurface: AppColorConstant.appBlack,
            ),
            fontFamily: AppAsset.defaultFont,
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 2,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      dateController.text = DateFormatUtills.instance.getBirthDateFormattedDateTime(picked);
      dateTime = picked;
      update();
    }
  }

}
