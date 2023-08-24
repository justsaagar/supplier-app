import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:supplier/routes/route_helper.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/string_extensions.dart';
import 'package:supplier/utils/utils.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  Timer? timer;
  double timerValue = 30;
  Country countryMap = const Country(
    name: "India",
    nameTranslations: {
      "sk": "India",
      "se": "India",
      "pl": "Indie",
      "no": "India",
      "ja": "インド",
      "it": "India",
      "zh": "印度",
      "nl": "India",
      "de": "Indien",
      "fr": "Inde",
      "es": "India",
      "en": "India",
      "pt_BR": "Índia",
      "sr-Cyrl": "Индија",
      "sr-Latn": "Indija",
      "zh_TW": "印度",
      "tr": "Hindistan",
      "ro": "India",
      "ar": "الهند",
      "fa": "هند",
      "yue": "印度"
    },
    flag: "🇮🇳",
    code: "IN",
    dialCode: "91",
    minLength: 10,
    maxLength: 10,
  );

  void onCountryChange(Country value) {
    countryMap = value;
    mobileNumberController.clear();
  }

  void manageTimer() {
    timerValue = 30;
    if (timer != null) timer!.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timers) {
      if (timerValue != 0) {
        timerValue--;
      } else {
        timer!.cancel();
      }
      update();
    });
  }

  Future<void> signInPhoneNumber() async {
    try {
      final response = await RestServices.instance.postRestCall(
        endpoint: RestConstants.instance.logInWithPhone,
        addOns: '?phoneNumber=${mobileNumberController.value.text.trim()}&role=Supplier',
        body: {},
      );
      if (response != null && response.isNotEmpty) {
        final Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap['response']) {
          await sendOtp('send');
          Get.toNamed(RouteHelper.getOtpVerificationRoute());
        } else {
          'Store number is not registered.!'.showError();
        }
      }
    } on SocketException catch (e) {
      logs('Catch exception in signInPhoneNumber --> ${e.message}');
    }
  }

  Future<void> sendOtp(String otpType) async {
    try {
      final response = await RestServices.instance.postRestCall(
        endpoint: RestConstants.instance.sendOtp,
        addOns: '/$otpType?phoneNumber=${mobileNumberController.text}',
        body: {},
      );
      if (response != null && response.isNotEmpty) {
        final Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap['response']){
          Get.toNamed(RouteHelper.getOtpVerificationRoute());
        }
      }
    } on SocketException catch (e) {
      logs('Catch exception in signInPhoneNumber --> ${e.message}');
    }
  }
}
