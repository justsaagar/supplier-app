import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/screen/dashboard_module/dashboard_screen.dart';
import 'package:supplier/screen/dashboard_module/home/home_screen/home_screen.dart';
import 'package:supplier/screen/social_otp_verification_screen.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/string_extensions.dart';
import 'package:http/http.dart' as http;

class BankDetailsController extends GetxController {
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController bankBranchController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController googlePayController = TextEditingController();
  final TextEditingController phonePayController = TextEditingController();
  final TextEditingController paytmController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  bool isLoading = true;
  bool? phonePayVerified;
  bool? googlePayVerified;
  bool? paytmVerified;
  Map<String, dynamic> bankDetailsMap = {};

  @override
  void onInit() {
    getBankDetails();
    super.onInit();
  }

  void validateBankDetailsForm() {
    if (accountNameController.text.isEmpty) {
      'Please enter account holder name'.showError();
      return;
    } else if (accountNumberController.text.isEmpty) {
      'Please enter account number'.showError();
      return;
    } else if (ifscController.text.isEmpty) {
      'Please enter IFSC code'.showError();
      return;
    } else if (bankBranchController.text.isEmpty) {
      'Please enter branch name'.showError();
      return;
    } else if (bankNameController.text.isEmpty) {
      'Please enter bank name'.showError();
      return;
    } else if (googlePayController.text.isEmpty) {
      'Please enter Google Pay number'.showError();
      return;
    } else if (googlePayController.text.length < 10) {
      'Please enter valid Google Pay number'.showError();
      return;
    } else if (phonePayController.text.isEmpty) {
      'Please enter Phone Pay number'.showError();
      return;
    } else if (phonePayController.text.length < 10) {
      'Please enter valid Phone Pay number'.showError();
      return;
    } else if (paytmController.text.isEmpty) {
      'Please enter Paytm number'.showError();
      return;
    } else if (paytmController.text.length < 10) {
      'Please enter valid Paytm number'.showError();
      return;
    } else {
      update();
    }
    updateBankDetails();
  }

  Future<void> updateBankDetails() async {
    isLoading = true;
    update();
    // if (googlePayController.text != (bankDetailsMap['googlepay'] ?? '')) {
    //   // googlePayVerified = await signInPhoneNumber(googlePayController.text);
    //   if (googlePayVerified ?? false) {
    //     'Google pay number is verified'.showSuccess();
    //   } else {
    //     'Google pay number is not verified. Please verify it'.showError();
    //     isLoading = false;
    //     update();
    //     return;
    //   }
    // }
    // if (phonePayController.text != (bankDetailsMap['phonepay'] ?? '')) {
    //   // phonePayVerified = await signInPhoneNumber(phonePayController.text);
    //   if (phonePayVerified ?? false) {
    //     'Phone pay number is verified'.showSuccess();
    //   } else {
    //     'Phone pay number is not verified. Please verify it'.showError();
    //     isLoading = false;
    //     update();
    //     return;
    //   }
    // }
    // if (paytmController.text != (bankDetailsMap['paytm'] ?? '')) {
    //   // paytmVerified = await signInPhoneNumber(paytmController.text);
    //   if (paytmVerified ?? false) {
    //     'Paytm number is verified'.showSuccess();
    //   } else {
    //     'Paytm number is not verified. Please verify it'.showError();
    //     isLoading = false;
    //     update();
    //     return;
    //   }
    // }
    Map<String, dynamic> bodyMap = {
      'id': bankDetailsMap['id'],
      'accountNumber': accountNumberController.text,
      'accuntName': accountNameController.text,
      'ifsc': ifscController.text,
      'bankbranch': bankBranchController.text,
      'bank': bankNameController.text,
      'googlepay': (googlePayVerified ?? false) ?  googlePayController.text : '',
      'phonepay':(phonePayVerified ?? false) ?  phonePayController.text : '',
      'paytm': (paytmVerified ?? false) ? paytmController.text : '',
    };
    log('Body map --> $bodyMap');
    final response = await RestServices.instance.putRestCall(endpoint: RestConstants.instance.editProfile, body: bodyMap);
    if (response != null && response.isNotEmpty) {
      Get.snackbar(
        'Profile.!',
        'Profile updated successfully.!',
        backgroundColor: AppColorConstant.appGreen,
        colorText: AppColorConstant.appWhite,
      );
      Get.offAll(() => const DashboardScreen(), transition: Transition.fadeIn);
    }
    isLoading = false;
    update();
  }

  Future<void> getBankDetails() async {
    isLoading = true;
    update();
    String url = '${RestConstants.instance.editProfile}/${AppStringConstants.storeLogInId}';
    log('Url --> $url');
    final response = await RestServices.instance.getRestCall(endpoint: RestConstants.instance.editProfile, addOns: '/${AppStringConstants.storeLogInId}');
    if (response != null && response.isNotEmpty) {
      Map<String, dynamic> responseBody = jsonDecode(response);
      log('Response body --> $responseBody');
      if (responseBody.isNotEmpty) {
        bankDetailsMap = responseBody;
      }
      accountNumberController.text = bankDetailsMap['accountNumber'] ?? '';
      accountNameController.text = bankDetailsMap['accuntName'] ?? '';
      ifscController.text = bankDetailsMap['ifsc'] ?? '';
      bankBranchController.text = bankDetailsMap['bankbranch'] ?? '';
      bankNameController.text = bankDetailsMap['bank'] ?? '';
      googlePayController.text = bankDetailsMap['googlepay'] ?? '';
      phonePayController.text = bankDetailsMap['phonepay'] ?? '';
      paytmController.text = bankDetailsMap['paytm'] ?? '';
    }
    googlePayVerified = googlePayController.text.isNotEmpty;
    phonePayVerified = phonePayController.text.isNotEmpty;
    paytmVerified = paytmController.text.isNotEmpty;
    log('bankDetailsMap --> $bankDetailsMap');
    isLoading = false;
    update();
  }

  Future<bool> signInPhoneNumber(String phoneController) async {
    try {
      if (phoneController.length < 10) {
        'Please enter valid number'.showError();
        return false;
      }
      final response = await RestServices.instance.postRestCall(
        endpoint: RestConstants.instance.sendOtp,
        addOns: '/send?phoneNumber=$phoneController',
        body: {},
      );
      if (response != null && response.isNotEmpty) {
        bool isValid = await Get.to(() => SocialOtpVerificationScreen(phoneController: phoneController));
        log('IsValid --> $isValid');
        otpController.clear();
        return bool.tryParse(isValid.toString()) ?? false;
      }
    } on TimeoutException catch (e) {
      e.message.toString().showError();
    } on SocketException catch (e) {
      e.message.toString().showError();
    } on Error catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<bool> verifyPhoneNumber(String phoneController) async {
    try {
      String url = '${RestConstants.instance.supplierBaseUrl}/api-auth/verify/otp?phoneNumber=$phoneController&otp=${otpController.text}';
      log('Url --> $url');
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      log('Response body --> $responseBody');
      if (response.statusCode == 200 &&
          responseBody['type'].toString().toLowerCase() == 'success') {
        Get.back(result: true);
        otpController.clear();
        responseBody['message'].toString().showSuccess();
      } else {
        responseBody['message'].toString().showError();
      }
    } on TimeoutException catch (e) {
      e.message.toString().showError();
    } on SocketException catch (e) {
      e.message.toString().showError();
    } on Error catch (e) {
      log(e.toString());
    }
    return false;
  }
}
