import 'dart:convert';
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
  // final TextEditingController ownerNameController = TextEditingController();
  // final TextEditingController storeNameController = TextEditingController();
  // final TextEditingController mobileNumberController = TextEditingController();
  // final TextEditingController emailAddressController = TextEditingController();
  // final TextEditingController weddingAnniversaryController = TextEditingController();
  // final TextEditingController childOneController = TextEditingController();
  // final TextEditingController childTwoController = TextEditingController();
  // final TextEditingController addressController = TextEditingController();
  // final TextEditingController areaController = TextEditingController();
  // final TextEditingController dealsInController = TextEditingController();
  // final TextEditingController popularInController = TextEditingController();
  // final TextEditingController gstNumberController = TextEditingController();
  // final TextEditingController storeLicenseNumberController = TextEditingController();
  // final TextEditingController drugNumberController = TextEditingController();
  // String gstDocument = '';
  // String storeLicenseDocument = '';
  // String drugLicenceDocument = '';
  StoreProfileModel? storeProfileModel;

  // var isLoading = false.obs;
  // var isButtonLoading = false.obs;
  final ImagePicker imagePicker = ImagePicker();

  // String userId = "";

  /// Edit Profile Screen
  var isLoading = false.obs;
  RxString selectedBusinessType = "Retailer".obs;
  String businessType = "";
  String selectBusiness = "";
  String selectBusinessId = "";
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeNumberController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();

  TextEditingController areaController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController storeLicenseController = TextEditingController();
  TextEditingController drugLicenseController = TextEditingController();
  TextEditingController pharmaNameController = TextEditingController();
  TextEditingController documentController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController dealsInController = TextEditingController();
  TextEditingController popularController = TextEditingController();
  TextEditingController storeOpeningController = TextEditingController();
  TextEditingController storeClosingController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController weddingAniversaryController = TextEditingController();
  TextEditingController retailerBirthdateController = TextEditingController();
  TextEditingController childOneController = TextEditingController();
  TextEditingController childTwoController = TextEditingController();
  TextEditingController deliveryStrengthController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String otp = "";
  List<DeliverySlotsModel> deliverySlotsList = [];
  List businessCategoryList = [];
  String? storeBackImage;
  String? storeFrontImage;
  String? gstNumber;
  String? storeLicense;
  String? storeDrugLicense;
  var profileData = {};
  String? latitude;
  String? longitude;

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

  // void onCountryChange(Country value) {
  //   countryMap = value;
  //   mobileNumberController.clear();
  // }

  Future<void> selectBannerImage(ImageSource imageSource, bool isBack, String? type) async {
    final XFile? image =
        await imagePicker.pickImage(source: imageSource, imageQuality: 50, preferredCameraDevice: CameraDevice.rear);
    if (image != null) {
      Get.back();
      if (type != null) {
        if (type == 'gst') {
          gstNumber = await uploadProfilePhoto(image.path);
        } else if (type == 'store') {
          storeLicense = await uploadProfilePhoto(image.path);
        } else if (type == 'drug') {
          storeDrugLicense = await uploadProfilePhoto(image.path);
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
      final response = await RestServices.instance.getRestCall(
        endpoint: RestConstants.instance.storeProfile,
        addOns: '/${AppStringConstants.storeLogInId}',
      );
      if (response != null && response.isNotEmpty) {
        storeProfileModel = storeProfileModelFromJson(response);
        ownerNameController.text = storeProfileModel?.ownerName ?? '';
        storeNameController.text = storeProfileModel?.storeName ?? '';
        phoneController.text = storeProfileModel?.phoneNumber ?? '';
        emailController.text = storeProfileModel?.email ?? '';
        weddingAniversaryController.text =
            DateTimeUtils.getStoreBirthDateTime(storeProfileModel?.retailerMarriageDay ?? DateTime.now());
        childOneController.text =
            DateTimeUtils.getStoreBirthDateTime(storeProfileModel?.retailerChildOneBirthDay ?? DateTime.now());
        childTwoController.text =
            DateTimeUtils.getStoreBirthDateTime(storeProfileModel?.retailerChildTwoBirthDay ?? DateTime.now());
        addressController.text = storeProfileModel?.storeAddressDetailRequest.first.addressLine1 ?? '';
        areaController.text = storeProfileModel?.storeAddressDetailRequest.first.landMark ?? '';
        dealsInController.text = storeProfileModel?.dealsIn ?? '';
        popularController.text = storeProfileModel?.popularIn ?? '';
        gstController.text = storeProfileModel?.gst?.gstNumber ?? '';
        storeLicenseController.text = storeProfileModel?.storeLicense?.storeLicenseNumber ?? '';
        drugLicenseController.text = storeProfileModel?.drugLicense?.drugLicenseNumber ?? '';
      }
      update();
    } on SocketException catch (e) {
      logs('Catch exception in getStoreProfile --> ${e.message}');
    }
  }

  Future<dynamic> editProfileDataApi() async {
    try {
      List<Map<String, dynamic>> slotsListMap = [];
      for (DeliverySlotsModel element in deliverySlotsList) {
        slotsListMap.add(element.toJson());
      }
      String fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
      Map<String, dynamic> bodyMap = {
        "id": AppStringConstants.storeLogInId,
        "fcmToken": fcmToken,
        "email": emailController.text,
        "phoneNumber": phoneController.text,
        "password": profileData['password'],
        "otp": profileData['otp'],
        "storeName": storeNameController.text,
        "businessType": "Retailer",
        "storeCategory": selectBusiness,
        "storeCategoryId": selectBusinessId,
        "ownerName": ownerNameController.text,
        "isDeleted": profileData['isDeleted'],
        "isActive": profileData['isActive'],
        "createdAt": profileData['createdAt'],
        "createdBy": profileData['createdBy'],
        "modifiedBy": profileData['modifiedBy'],
        "modifiedDate": "2023-05-27T20:27:13.492Z",
        "dealsIn": dealsInController.text,
        "popularIn": popularController.text,
        "storeNumber": storeNumberController.text,
        "openTime": storeOpeningController.text,
        "closeTime": storeClosingController.text,
        "deliveryStrength": deliveryStrengthController.text,
        "applicationStatus":
            profileData['applicationStatus'] == "Rejected" ? "Pending" : profileData['applicationStatus'],
        "applicationStatusDate": profileData['applicationStatusDate'],
        "boarded": profileData['boarded'],
        "retailerBirthday": retailerBirthdateController.text,
        "retailerMarriageDay": weddingAniversaryController.text,
        "retailerChildOneBirthDay": childOneController.text,
        "retailerChildTwoBirthDay": childTwoController.text,
        "retailerMessage": messageController.text,
        "storeRating": profileData['storeRating'],
        "storeLiveStatus": profileData['storeLiveStatus'],
        "storeDisplayid": profileData['storeDisplayid'],
        "profileUpdateEnbale": profileData['profileUpdateEnbale'],
        'gst': {'gstNumber': gstController.text, 'docUrl': gstNumber == null ? '' : gstNumber.toString()},
        'storeLicense': {
          'storeLicense': storeLicenseController.text,
          'docUrl': storeLicense == null ? '' : storeLicense.toString()
        },
        'drugLicense': {
          'drugLicenseNumber': drugLicenseController.text,
          'documentId': storeDrugLicense == null ? '' : storeDrugLicense.toString()
        },
        "deliveryType": profileData['deliveryType'],
        'slots': slotsListMap,
        "storeAddressDetailRequest": [
          {
            "mobileNumber": profileData['mobileNumber'] ?? "",
            "name": profileData['name'] ?? "",
            "addresslineMobileOne": profileData['addresslineMobileOne'],
            "addresslineMobileTwo": profileData['addresslineMobileTwo'],
            "addressType": profileData['addressType'] ?? "",
            "alterNateMobileNumber": profileData['alterNateMobileNumber'],
            "emailId": profileData['emailId'],
            "pinCode": profileData['pinCode'],
            'addressLine1': addressController.text,
            "addressLine2": profileData['addressLine2'],
            'landMark': profileData['landMark'],
            "city": profileData['city'],
            "region": profileData['region'],
            "state": profileData['state'],
            'latitude': latitude.toString(),
            'longitude': longitude.toString(),
            "geoLocation": {
              "x": profileData['x'],
              "y": profileData['y'],
              "type": profileData['type'],
              "coordinates": profileData['coordinates'],
            }
          }
        ],
        "imageUrl": {'bannerImageId': storeBackImage, 'profileImageId': storeFrontImage},
        "drugLicenseAddress": documentController.text,
        "reason": profileData['reason'],
        "gstVerifed": profileData['gstVerifed'],
        "storeLicenseVerifed": profileData['storeLicenseVerifed'],
        "drugLicenseVerifed": profileData['drugLicenseVerifed'],
        "registeredPharmacistName": pharmaNameController.text
      };
      final response = await RestServices.instance.putRestCall(
        endpoint: RestConstants.instance.storeProfile,
        body: bodyMap,
      );
      if (response != null && response.isNotEmpty) {
        final Map<String, dynamic> responseMap = jsonDecode(response);
        responseMap['message'].toString().showError();
      }
      update();
    } on SocketException catch (e) {
      logs('Catch exception in editProfileDataApi --> ${e.message}');
    }
  }
}
