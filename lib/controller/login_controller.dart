import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';

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
}
