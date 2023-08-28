import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/model/store_profile_model.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/date_utils.dart';
import 'package:supplier/utils/string_extensions.dart';
import 'package:supplier/utils/utils.dart';

import '../model/delivery_slots_model.dart';

class EditProfileController extends GetxController {
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController storeNumberController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController weddingAnniversaryController = TextEditingController();
  final TextEditingController childOneController = TextEditingController();
  final TextEditingController childTwoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController dealsInController = TextEditingController();
  final TextEditingController popularInController = TextEditingController();
  final TextEditingController regPharmaNameController = TextEditingController();
  final TextEditingController gstNumberController = TextEditingController();
  final TextEditingController storeLicenseNumberController = TextEditingController();
  final TextEditingController drugNumberController = TextEditingController();
  final TextEditingController documentAddressController = TextEditingController();
  final TextEditingController storeOpeningController = TextEditingController();
  final TextEditingController storeClosingController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController childOneBirthDateController = TextEditingController();
  final TextEditingController childTwoBirthDateController = TextEditingController();
  final TextEditingController deliveryStrengthController = TextEditingController();
  final TextEditingController messageToCustomerController = TextEditingController();
  bool isLoading = false;
  String gstDocument = '';
  String storeBackImage = '';
  String storeFrontImage = '';
  String drugLicenceDocument = '';
  String storeLicenseDocument = '';
  StoreProfileModel? storeProfileModel;
  final ImagePicker imagePicker = ImagePicker();
  List<DeliverySlotsModel> deliverySlotsList = [];

  @override
  void onInit() {
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

  Future<void> selectBannerImage(ImageSource imageSource, bool isBack, String? type) async {
    final XFile? image =
        await imagePicker.pickImage(source: imageSource, imageQuality: 50, preferredCameraDevice: CameraDevice.rear);
    if (image != null) {
      Get.back();
      if (type != null) {
        if (type == 'gst') {
          gstDocument = await uploadProfilePhoto(image.path);
        } else if (type == 'store') {
          storeLicenseDocument = await uploadProfilePhoto(image.path);
        } else if (type == 'drug') {
          drugLicenceDocument = await uploadProfilePhoto(image.path);
        }
      } else {
        if (isBack) {
          storeBackImage = await uploadProfilePhoto(image.path);
        } else {
          storeFrontImage = await uploadProfilePhoto(image.path);
        }
      }
    }
    refresh();
    update();
  }

  Future<dynamic> uploadProfilePhoto(filepath) async {
    try {
      final response = await RestServices.instance.multiPartRestCall(
        endpoint: RestConstants.instance.logInWithPhone,
        body: {},
        keyName: 'image',
        fileName: filepath,
      );
      if (response != null && response.isNotEmpty) {
        final Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap['response']) {
          responseMap['imgId'].toString();
        } else {
          'Something went wrong.'.showError();
        }
      }
    } on SocketException catch (e) {
      logs('Catch exception in signInPhoneNumber --> ${e.message}');
    }
  }

  Future<void> getStoreProfile() async {
    try {
      deliverySlotsList.clear();
      final response = await RestServices.instance.getRestCall(
        endpoint: RestConstants.instance.storeProfile,
        addOns: '/${AppStringConstants.storeLogInId}',
      );
      if (response != null && response.isNotEmpty) {
        storeProfileModel = storeProfileModelFromJson(response);
        storeBackImage = storeProfileModel?.imageUrl?.bannerImageId ?? '';
        storeFrontImage = storeProfileModel?.imageUrl?.profileImageId ?? '';
        ownerNameController.text = storeProfileModel?.ownerName ?? '';
        storeNameController.text = storeProfileModel?.storeName ?? '';
        mobileNumberController.text = storeProfileModel?.phoneNumber ?? '';
        emailAddressController.text = storeProfileModel?.email ?? '';
        weddingAnniversaryController.text = storeProfileModel?.retailerMarriageDay ?? '';
        addressController.text = storeProfileModel?.storeAddressDetailRequest.first.addressLine1 ?? '';
        areaController.text = storeProfileModel?.storeAddressDetailRequest.first.landMark ?? '';
        dealsInController.text = storeProfileModel?.dealsIn ?? '';
        popularInController.text = storeProfileModel?.popularIn ?? '';
        regPharmaNameController.text = storeProfileModel?.registeredPharmacistName ?? '';
        gstNumberController.text = storeProfileModel?.gst?.gstNumber ?? '';
        storeLicenseNumberController.text = storeProfileModel?.storeLicense?.storeLicenseNumber ?? '';
        drugNumberController.text = storeProfileModel?.drugLicense?.drugLicenseNumber ?? '';
        documentAddressController.text = storeProfileModel?.drugLicenseAddress ?? '';
        storeOpeningController.text = storeProfileModel?.openTime ?? '';
        storeClosingController.text = storeProfileModel?.closeTime ?? '';
        birthDateController.text = storeProfileModel?.retailerMarriageDay ?? '';
        childOneController.text = storeProfileModel?.retailerChildOneBirthDay ?? '';
        childTwoController.text = storeProfileModel?.retailerChildTwoBirthDay ?? '';
        deliveryStrengthController.text = storeProfileModel?.deliveryStrength ?? '';
        deliverySlotsList.addAll(storeProfileModel?.slots ?? []);
      }
      deliverySlotsList.sort((a, b) => (a.displayOrder ?? 0).compareTo((b.displayOrder ?? 0)));
      update();
    } on SocketException catch (e) {
      logs('Catch exception in getStoreProfile --> ${e.message}');
    }
  }

  Future<dynamic> editProfileDataApi() async {
    try {
      List<Map<String, dynamic>> slotsListMap = [];
      deliverySlotsList.sort((a, b) => (a.displayOrder ?? 0).compareTo((b.displayOrder ?? 0)));
      for (DeliverySlotsModel element in deliverySlotsList) {
        slotsListMap.add({
          "slotId": element.slotId,
          "slotName": element.slotName,
          "startTime": element.startTime,
          "endTime": element.endTime,
          "isChecked": element.isChecked,
          "displayOrder": element.displayOrder
        });
      }
      log('slot --> $slotsListMap');
      String fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
      Map<String, dynamic> bodyMap = {
        "id": AppStringConstants.storeLogInId,
        "fcmToken": fcmToken,
        "email": emailAddressController.text,
        "phoneNumber": mobileNumberController.text,
        "password": storeProfileModel?.password,
        "otp": storeProfileModel?.otp,
        "storeName": storeNameController.text,
        "businessType": "Retailer",
        "storeCategory": storeProfileModel?.storeCategory,
        "storeCategoryId": storeProfileModel?.storeCategoryId,
        "ownerName": ownerNameController.text,
        "isDeleted": storeProfileModel?.isDeleted,
        "isActive": storeProfileModel?.isActive,
        "createdAt": storeProfileModel?.createdAt,
        "createdBy": storeProfileModel?.createdBy,
        "modifiedBy": storeProfileModel?.modifiedBy,
        "modifiedDate": "2023-05-27T20:27:13.492Z",
        "dealsIn": dealsInController.text,
        "popularIn": popularInController.text,
        "storeNumber": storeNumberController.text,
        "openTime": storeOpeningController.text,
        "closeTime": storeClosingController.text,
        "deliveryStrength": deliveryStrengthController.text,
        "applicationStatus": storeProfileModel?.applicationStatus == "Rejected" ? "Pending" : storeProfileModel?.applicationStatus,
        "applicationStatusDate": storeProfileModel?.applicationStatusDate,
        "boarded": storeProfileModel?.boarded,
        "retailerBirthday": birthDateController.text,
        "retailerMarriageDay": weddingAnniversaryController.text,
        "retailerChildOneBirthDay": childOneController.text,
        "retailerChildTwoBirthDay": childTwoController.text,
        "retailerMessage": messageToCustomerController.text,
        "storeRating": storeProfileModel?.storeRating,
        "storeLiveStatus": storeProfileModel?.storeLiveStatus,
        "storeDisplayid": storeProfileModel?.storeDisplayId,
        "profileUpdateEnbale": storeProfileModel?.profileUpdateEnable,
        'gst': {'gstNumber': gstNumberController.text, 'docUrl': gstDocument},
        'storeLicense': {
          'storeLicense': storeLicenseNumberController.text,
          'docUrl': storeLicenseDocument
        },
        'drugLicense': {
          'drugLicenseNumber': drugNumberController.text,
          'documentId': drugLicenceDocument
        },
        "deliveryType": storeProfileModel?.deliveryType,
        'slots': slotsListMap,
        // 'slots': [
        //   {
        //     "slotId": "451f75bf-06fa-42c5-95f0-eccafea13268",
        //     "slotName": "Forenoon",
        //     "startTime": "11:00 AM",
        //     "endTime": "01:00 PM",
        //     "isChecked": true,
        //     "displayOrder": 1
        //   },
        //   {
        //     "slotId": "c1008373-c09e-49cb-9e2b-8374694fe372",
        //     "slotName": "Afternoon",
        //     "startTime": "01:00 PM",
        //     "endTime": "03:00 PM",
        //     "isChecked": true,
        //     "displayOrder": 2
        //   },
        //   {
        //     "slotId": "0198bea9-873e-47c5-9df4-2c6dc6fc6e43",
        //     "slotName": "Late Afternoon",
        //     "startTime": "03:00 PM",
        //     "endTime": "05:00 PM",
        //     "isChecked": true,
        //     "displayOrder": 3
        //   },
        //   {
        //     "slotId": "873b63a5-f878-4c79-b756-ba38ccc9b5a6",
        //     "slotName": "Evening ",
        //     "startTime": "05:00 PM",
        //     "endTime": "07:00 PM",
        //     "isChecked": true,
        //     "displayOrder": 4
        //   },
        //   {
        //     "slotId": "eee538c8-2586-4d1f-99e9-74f21642de09",
        //     "slotName": "Morning",
        //     "startTime": "09:00 AM",
        //     "endTime": "11:00 AM",
        //     "isChecked": true,
        //     "displayOrder": 0
        //   }
        // ],
        "storeAddressDetailRequest": [
          {
            "mobileNumber": storeProfileModel?.storeAddressDetailRequest.first.mobileNumber,
            "name": storeProfileModel?.storeAddressDetailRequest.first.name ?? "",
            "addresslineMobileOne": storeProfileModel?.storeAddressDetailRequest.first.addressLineMobileOne,
            "addresslineMobileTwo": storeProfileModel?.storeAddressDetailRequest.first.addressLineMobileTwo,
            "addressType": storeProfileModel?.storeAddressDetailRequest.first.addressType ?? "",
            "alterNateMobileNumber": storeProfileModel?.storeAddressDetailRequest.first.alterNateMobileNumber,
            "emailId": storeProfileModel?.storeAddressDetailRequest.first.emailId,
            "pinCode": storeProfileModel?.storeAddressDetailRequest.first.pinCode,
            'addressLine1': storeProfileModel?.storeAddressDetailRequest.first.addressLine1,
            "addressLine2": storeProfileModel?.storeAddressDetailRequest.first.addressLine2,
            'landMark': storeProfileModel?.storeAddressDetailRequest.first.landMark,
            "city": storeProfileModel?.storeAddressDetailRequest.first.city,
            "region": storeProfileModel?.storeAddressDetailRequest.first.region,
            "state": storeProfileModel?.storeAddressDetailRequest.first.state,
            'latitude': storeProfileModel?.storeAddressDetailRequest.first.latitude,
            'longitude': storeProfileModel?.storeAddressDetailRequest.first.longitude,
            "geoLocation": {
              "x": storeProfileModel?.storeAddressDetailRequest.first.geoLocation?.x,
              "y": storeProfileModel?.storeAddressDetailRequest.first.geoLocation?.y,
              "type": storeProfileModel?.storeAddressDetailRequest.first.geoLocation,
              "coordinates": storeProfileModel?.storeAddressDetailRequest.first.geoLocation?.coordinates,
            }
          }
        ],
        "imageUrl": {'bannerImageId': storeBackImage, 'profileImageId': storeFrontImage},
        "drugLicenseAddress": documentAddressController.text,
        "reason": storeProfileModel?.reason,
        "gstVerifed": storeProfileModel?.gstVerifed,
        "storeLicenseVerifed": storeProfileModel?.storeLicenseVerifed,
        "drugLicenseVerifed": storeProfileModel?.drugLicenseVerifed,
        "registeredPharmacistName": regPharmaNameController.text
      };
      log('Response map --> ${jsonEncode(bodyMap)}');
      // return;
      final response = await RestServices.instance.putRestCall(
        endpoint: RestConstants.instance.storeProfile,
        body: bodyMap,
      );
      if (response != null && response.isNotEmpty) {
        final Map<String, dynamic> responseMap = jsonDecode(response);
        'Profile updated successfully'.showSuccess();
      }
      update();
    } on SocketException catch (e) {
      logs('Catch exception in editProfileDataApi --> ${e.message}');
    }
  }
}
