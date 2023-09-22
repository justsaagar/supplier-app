import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/model/delivery_boy_list_model.dart';
import 'package:supplier/model/emp_model.dart';
import 'package:supplier/screen/dashboard_module/home/home_screen/home_screen.dart';
import 'package:supplier/service/rest_service.dart';

class DeliveryController extends GetxController {
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtAltMobile = TextEditingController();
  TextEditingController txtCity = TextEditingController();
  TextEditingController txtDeliveryArea = TextEditingController();
  TextEditingController txtVNumber = TextEditingController();
  TextEditingController txtAadhaar = TextEditingController();
  TextEditingController txtLicenceNumber = TextEditingController();
  TextEditingController txtLicenceExp = TextEditingController();
  TextEditingController txtDateOfBirth = TextEditingController();
  TextEditingController txtJoinDate = TextEditingController();
  TextEditingController txtAccountName = TextEditingController();
  TextEditingController txtBankName = TextEditingController();
  TextEditingController txtAccountNumber = TextEditingController();
  TextEditingController txtBranchName = TextEditingController();
  TextEditingController txtIFSCCode = TextEditingController();
  TextEditingController txtPanNumber = TextEditingController();
  TextEditingController txtDepositeAmt = TextEditingController();
  TextEditingController txtAssetGiven = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  String? profileImage;
  String? aadharCardURL;
  String? panCardURL;
  String? drivingLicenseNumberURL;
  RxBool isLoading = false.obs;
  EmployeeModel? employeeModel;
  List<Content> content = [];

  Future<void> getRiders() async {
    try {
      final String? response = await RestServices.instance.getRestCall(endpoint: '${RestConstants.instance.getAllRiders}${AppStringConstants.storeLogInId}?page=0&size=10');
      if (response != null && response.isNotEmpty) {
        DeliveryBoyListModel deli = deliveryBoyListModelFromJson(response);
        content = deli.content;
        update();
      }
    } on SocketException catch (e) {
      log('Socket --> ${e.message}');
    }
  }

  Future<void> selectProfileImage(ImageSource imageSource) async {
    Get.back();
    final XFile? image =
        await imagePicker.pickImage(source: imageSource, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
    if (image != null) {
      profileImage = image.path;
      update();
    }
  }

  Future<void> selectAdharImage(ImageSource imageSource) async {
    Get.back();
    final XFile? image =
        await imagePicker.pickImage(source: imageSource, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
    if (image != null) {
      aadharCardURL = image.path;
      update();
    }
  }

  Future<void> selectPanImage(ImageSource imageSource) async {
    Get.back();
    final XFile? image =
        await imagePicker.pickImage(source: imageSource, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
    if (image != null) {
      panCardURL = image.path;
      update();
    }
  }

  Future<void> selectDrivingImage(ImageSource imageSource) async {
    Get.back();
    final XFile? image =
        await imagePicker.pickImage(source: imageSource, imageQuality: 50, preferredCameraDevice: CameraDevice.front);
    if (image != null) {
      drivingLicenseNumberURL = image.path;
      update();
    }
  }

  Future<void> saveProfile() async {
    // try {
    isLoading = true.obs;
    update();
    Map<String, dynamic> bodyMap = {
      "firstName": txtFirstName.text,
      "lastName": txtLastName.text,
      "email": txtEmail.text,
      "password": txtPassword.text,
      "phoneNumber": txtMobile.text,
      "alterNativephoneNumber": txtAltMobile.text,
      "aadharCard": txtAadhaar.text,
      "aadharCardURL": await RestServices.instance.multiPartRestCall(keyName: 'image', fileName: aadharCardURL!, endpoint: RestConstants.instance.uploadImage, body: {}),
      "drivingLicenseNumber": txtLicenceNumber.text,
      "drivingLicenseNumberURL": await RestServices.instance.multiPartRestCall(keyName: 'image', fileName: drivingLicenseNumberURL!, endpoint: RestConstants.instance.uploadImage, body: {}),
      "drivingLicenseExpiry": txtLicenceExp.text,
      "delivaryArea": txtDeliveryArea.text,
      "city": txtCity.text,
      "panCard": txtPanNumber.text,
      "panCardURL": await RestServices.instance.multiPartRestCall(keyName: 'image', fileName: panCardURL!, endpoint: RestConstants.instance.uploadImage, body: {}),
      "vechicleNumber": txtVNumber.text,
      "bankAccountName": txtAccountName.text,
      "bankName": txtBankName.text,
      "bankAccountNumber": txtAccountNumber.text,
      "ifsccode": txtIFSCCode.text,
      "bankBranch": txtBranchName.text,
      "userImageId": await RestServices.instance.multiPartRestCall(keyName: 'image', fileName: profileImage!, endpoint: RestConstants.instance.uploadImage, body: {}),
      "amountDeposited": txtDepositeAmt.text,
      "storeId": AppStringConstants.storeLogInId.isEmpty
          ? "AL-R202306-001"
          : AppStringConstants.storeLogInId,
      "applicationVerified": true,
      "profileUpdateEnable": true,
      "assetsGiven": txtAssetGiven.text,
      "joinDate": txtJoinDate.text,
      "dateOfBirth": txtDateOfBirth.text,
      "isDeleted": "N",
      "isActive": "Y",
      "grade": "A"
    };
    log('Body map --> $bodyMap');
    final response = await RestServices.instance.postRestCall(endpoint: RestConstants.instance.registerRider, body: bodyMap);
    if (response != null && response.isNotEmpty) {
      Get.offAll(() => const HomeScreen(), transition: Transition.size);
      Get.snackbar('${jsonDecode(response)['message']}', '');
    }
    isLoading = false.obs;
    update();
  }
}
