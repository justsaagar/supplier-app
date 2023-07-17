import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController areaNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController drugLicenceController = TextEditingController();
  final TextEditingController gstNumberController = TextEditingController();
  final TextEditingController storeRegisterController = TextEditingController();
  final TextEditingController pharmaController = TextEditingController();
  String? selectedBusiness;
  num selectedBusinessIndex = -1;
  String? drugLicense;
  String? gstNumber;
  String? storeRegister;
  List<String> hello = ['a', 'b'];
}