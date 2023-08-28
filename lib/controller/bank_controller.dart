import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/screen/dashboard_module/home/home_screen/home_screen.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/string_extensions.dart';
import 'package:supplier/utils/validation_utils.dart';
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
  bool isLoading = true;
  bool phonePayVerified = false;
  bool googlePayVerified = false;
  bool paytmVerified = false;
  String otp = '';
  Map<String, dynamic> bankDetailsMap = {};

  @override
  void onInit() {
    // getBankDetails();
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
      phonePayVerified = true;
      googlePayVerified = true;
      paytmVerified = true;
    }
    updateBankDetails();
  }

  Future<void> updateBankDetails() async {
    isLoading = true;
    update();
    if (googlePayController.text != (bankDetailsMap['googlepay'] ?? '')) {
      // googlePayVerified = await signInPhoneNumber(googlePayController.text);
      if (googlePayVerified) {
        'Google pay number is verified'.showSuccess();
      } else {
        'Google pay number is not verified. Please verify it'.showError();
        isLoading = false;
        update();
        return;
      }
    }
    if (phonePayController.text != (bankDetailsMap['phonepay'] ?? '')) {
      // phonePayVerified = await signInPhoneNumber(phonePayController.text);
      if (phonePayVerified) {
        'Phone pay number is verified'.showSuccess();
      } else {
        'Phone pay number is not verified. Please verify it'.showError();
        isLoading = false;
        update();
        return;
      }
    }
    if (paytmController.text != (bankDetailsMap['paytm'] ?? '')) {
      // paytmVerified = await signInPhoneNumber(paytmController.text);
      if (paytmVerified) {
        'Paytm number is verified'.showSuccess();
      } else {
        'Paytm number is not verified. Please verify it'.showError();
        isLoading = false;
        update();
        return;
      }
    }
    Map<String, dynamic> bodyMap = {
      'id': bankDetailsMap['id'],
      'accountNumber': accountNumberController.text,
      'accuntName': accountNameController.text,
      'ifsc': ifscController.text,
      'bankbranch': bankBranchController.text,
      'bank': bankNameController.text,
      'googlepay': googlePayController.text,
      'phonepay': phonePayController.text,
      'paytm': paytmController.text,
    };
    log('Body map --> $bodyMap');
    final response = await http.put(
      Uri.parse(RestConstants.instance.editProfile),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(bodyMap),
    );
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    log('Response body --> $responseBody');
    if (response.statusCode == 200) {
      if (responseBody.isNotEmpty) {
        Get.snackbar(
          'Profile.!',
          'Profile updated successfully.!',
          backgroundColor: AppColorConstant.appGreen,
          colorText: AppColorConstant.appWhite,
        );
        Get.offAll(() => const HomeScreen(), transition: Transition.fadeIn);
      }
    }
    isLoading = false;
    update();
  }

  Future<void> getBankDetails() async {
    // String userId = await PreferencesHelper()
    //         .getPreferencesStringData(PreferencesHelper.storeID) ??
    //     '';
    isLoading = true;
    update();
    String url = '${RestConstants.instance.editProfile}/$AppStringConstants.storeLogInId';
    log('Url --> $url');
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    log('Response body --> $responseBody');
    if (response.statusCode == 200) {
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
    log('bankDetailsMap --> $bankDetailsMap');
    isLoading = false;
    update();
  }
  //
  // Future<bool> signInPhoneNumber(String phoneController) async {
  //   try {
  //     String url =
  //         '${RestConstants.instance.sendOtp}/send?phoneNumber=$phoneController  ';
  //     log('Url --> $url');
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: <String, String>{'Content-Type': 'application/json'},
  //     );
  //     Map<String, dynamic> responseBody = jsonDecode(response.body);
  //
  //     if (response.statusCode == 200 &&
  //         responseBody['type'].toString().toLowerCase() == 'success') {
  //       otp = '';
  //       bool isValid = await Get.to(() =>
  //           SocialOtpVerificationScreen(phoneController: phoneController));
  //       log('IsValid --> $isValid');
  //       return bool.tryParse(isValid.toString()) ?? false;
  //     } else {
  //       responseBody['message'].toString().showError();
  //     }
  //   } on TimeoutException catch (e) {
  //     e.message.toString().showError();
  //   } on SocketException catch (e) {
  //     e.message.toString().showError();
  //   } on Error catch (e) {
  //     log(e.toString());
  //   }
  //   return false;
  // }
  //
  // Future<bool> verifyPhoneNumber(
  //     String phoneController, String otpNumber) async {
  //   try {
  //     String url =
  //         '${ApiConfig.verifyOtp}?phoneNumber=$phoneController&otp=$otpNumber';
  //     log('Url --> $url');
  //     final response = await http.get(
  //       Uri.parse(url),
  //       headers: <String, String>{'Content-Type': 'application/json'},
  //     );
  //     Map<String, dynamic> responseBody = jsonDecode(response.body);
  //     log('Response body --> $responseBody');
  //     if (response.statusCode == 200 &&
  //         responseBody['type'].toString().toLowerCase() == 'success') {
  //       Get.back(result: true);
  //       otp = '';
  //       responseBody['message'].toString().showSuccess();
  //     } else {
  //       responseBody['message'].toString().showError();
  //     }
  //   } on TimeoutException catch (e) {
  //     e.message.toString().showError();
  //   } on SocketException catch (e) {
  //     e.message.toString().showError();
  //   } on Error catch (e) {
  //     log(e.toString());
  //   }
  //   return false;
  // }
}
