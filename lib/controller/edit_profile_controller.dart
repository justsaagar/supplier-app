import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/model/store_profile_model.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/utils.dart';

class EditProfileController extends GetxController {
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  StoreProfileModel? storeProfileModel;
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

  Future<void> getStoreProfile() async {
    try {
      final response = await RestServices.instance.getRestCall(
        endpoint: RestConstants.instance.storeProfile,
        addOns: '/${AppStringConstants.storeLogInId}',
      );
      if (response != null && response.isNotEmpty) {
        storeProfileModel = storeProfileModelFromJson(response);
      }
      update();
    } on SocketException catch (e) {
      logs('Catch exception in getStoreProfile --> ${e.message}');
    }
  }
}
