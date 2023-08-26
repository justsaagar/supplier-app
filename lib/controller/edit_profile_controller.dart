import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/model/store_profile_model.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/date_utils.dart';
import 'package:supplier/utils/utils.dart';

class EditProfileController extends GetxController {
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController weddingAnniversaryController = TextEditingController();
  final TextEditingController childOneController = TextEditingController();
  final TextEditingController childTwoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController dealsInController = TextEditingController();
  final TextEditingController popularInController = TextEditingController();
  final TextEditingController gstNumberController = TextEditingController();
  final TextEditingController storeLicenseNumberController = TextEditingController();
  final TextEditingController drugNumberController = TextEditingController();
  String gstDocument = '';
  String storeLicenseDocument = '';
  String drugLicenceDocument = '';
  StoreProfileModel? storeProfileModel;

  @override
  void onInit() {
    // TODO: implement onInit
    getStoreProfile();
      super.onInit();
  }

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
        ownerNameController.text = storeProfileModel?.ownerName ?? '';
        storeNameController.text = storeProfileModel?.storeName ?? '';
        mobileNumberController.text = storeProfileModel?.phoneNumber ?? '';
        emailAddressController.text = storeProfileModel?.email ?? '';
        weddingAnniversaryController.text = DateTimeUtils.getStoreBirthDateTime(storeProfileModel?.retailerMarriageDay ?? DateTime.now());
        childOneController.text = DateTimeUtils.getStoreBirthDateTime(storeProfileModel?.retailerChildOneBirthDay ?? DateTime.now());
        childTwoController.text = DateTimeUtils.getStoreBirthDateTime(storeProfileModel?.retailerChildTwoBirthDay ?? DateTime.now());
        addressController.text = storeProfileModel?.storeAddressDetailRequest.first.addressLine1 ?? '';
        areaController.text = storeProfileModel?.storeAddressDetailRequest.first.landMark ?? '';
        dealsInController.text = storeProfileModel?.dealsIn ?? '';
        popularInController.text = storeProfileModel?.popularIn ?? '';
        gstNumberController.text = storeProfileModel?.gst?.gstNumber ?? '';
        storeLicenseNumberController.text = storeProfileModel?.storeLicense?.storeLicenseNumber ?? '';
        drugNumberController.text = storeProfileModel?.drugLicense?.drugLicenseNumber ?? '';
      }
      update();
    } on SocketException catch (e) {
      logs('Catch exception in getStoreProfile --> ${e.message}');
    }
  }
}
