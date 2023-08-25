import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_dropdown.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/app_text_form_field.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/controller/signup_controller.dart';
import 'package:supplier/routes/route_helper.dart';
import 'package:supplier/utils/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (SignUpController signUpController) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: Device.height,
                width: Device.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColorConstant.lightBlue, AppColorConstant.darkBlue],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              ListView(
                padding: EdgeInsets.symmetric(horizontal: 28.px),
                children: [
                  SizedBox(height: 58.px),
                  AppText('Sign up', fontSize: 30.px, fontWeight: FontWeight.w600, textAlign: TextAlign.center),
                  SizedBox(height: 36.px),
                  AppTextFormField(
                    controller: signUpController.usernameController,
                    headerTitle: 'User Name*',
                    hintText: 'E-mail address / User ID',
                    isLightMode: true,
                  ),
                  SizedBox(height: 16.px),
                  AppTextFormField(
                    controller: signUpController.phoneNoController,
                    headerTitle: 'Phone no.*',
                    hintText: 'Enter Phone Number',
                    isLightMode: true,
                  ),
                  SizedBox(height: 16.px),
                  AppTextFormField(
                    controller: signUpController.passwordController,
                    headerTitle: 'Password*',
                    hintText: 'Enter Password',
                    obscureText: true,
                    isLightMode: true,
                  ),
                  SizedBox(height: 16.px),
                  AppTextFormField(
                    controller: signUpController.passwordController,
                    headerTitle: 'Confirm password*',
                    hintText: 'Confirm password',
                    obscureText: true,
                    isLightMode: true,
                  ),
                  SizedBox(height: 16.px),
                  AppDropdownButton(
                    headerTitle: 'Business*',
                    title: 'Select Business',
                    value: signUpController.selectedBusiness,
                    onChanged: (value) {
                      signUpController.selectedBusiness = value ?? '';
                      signUpController.update();
                    },
                    items: List.generate(
                      signUpController.hello.length,
                      (index) => DropdownMenuItem(
                        value: signUpController.hello[index],
                        child: AppText(signUpController.hello[index]),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.px),
                  AppTextFormField(
                    controller: signUpController.emailController,
                    headerTitle: 'Email*',
                    hintText: 'Enter your email address',
                    isLightMode: true,
                  ),
                  SizedBox(height: 16.px),
                  AppTextFormField(
                    controller: signUpController.storeNameController,
                    headerTitle: 'Store Name*',
                    hintText: 'Enter Your Store Name',
                    isLightMode: true,
                  ),
                  SizedBox(height: 16.px),
                  AppTextFormField(
                    controller: signUpController.areaNameController,
                    headerTitle: 'Area*',
                    hintText: 'Enter Your Area',
                    isLightMode: true,
                  ),
                  SizedBox(height: 16.px),
                  AppTextFormField(
                    controller: signUpController.addressController,
                    headerTitle: 'Address',
                    hintText: 'Enter Your Address',
                    isLightMode: true,
                  ),
                  SizedBox(height: 16.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: AppTextFormField(
                          controller: signUpController.passwordController,
                          headerTitle: 'Drug License Number*',
                          hintText: 'Enter drug licence number',
                          isLightMode: true,
                        ),
                      ),
                      SizedBox(width: 10.px),
                      Container(
                        height: 50.px,
                        width: 50.px,
                        margin: EdgeInsets.only(top: 26.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.px),
                          color: AppColorConstant.lightGreyColor.withOpacity(0.19),
                        ),
                        alignment: Alignment.center,
                        child: const AppImageAsset(image: AppAsset.uploadIcon, color: AppColorConstant.appWhite),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: AppTextFormField(
                          controller: signUpController.gstNumberController,
                          headerTitle: 'GST Number*',
                          hintText: 'Enter GST number',
                          isLightMode: true,
                        ),
                      ),
                      SizedBox(width: 10.px),
                      Container(
                        height: 50.px,
                        width: 50.px,
                        margin: EdgeInsets.only(top: 26.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.px),
                          color: AppColorConstant.lightGreyColor.withOpacity(0.19),
                        ),
                        alignment: Alignment.center,
                        child: const AppImageAsset(image: AppAsset.uploadIcon, color: AppColorConstant.appWhite),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: AppTextFormField(
                          controller: signUpController.storeRegisterController,
                          headerTitle: 'Store Registration',
                          hintText: 'Enter Store Registration Number',
                          isLightMode: true,
                        ),
                      ),
                      SizedBox(width: 10.px),
                      Container(
                        height: 50.px,
                        width: 50.px,
                        margin: EdgeInsets.only(top: 26.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.px),
                          color: AppColorConstant.lightGreyColor.withOpacity(0.19),
                        ),
                        alignment: Alignment.center,
                        child: const AppImageAsset(image: AppAsset.uploadIcon, color: AppColorConstant.appWhite),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.px),
                  AppTextFormField(
                    controller: signUpController.pharmaController,
                    headerTitle: 'Registered Pharmacist Name*',
                    hintText: 'Enter Pharmacist Name',
                    isLightMode: true,
                  ),
                  SizedBox(height: 50.px),
                  AppElevatedButton(
                    buttonName: 'Register',
                    onPressed: () => Get.toNamed(RouteHelper.getMobileVerificationRoute()),
                  ),
                  SizedBox(height: 50.px),
                  InkWell(
                    onTap: () => Get.toNamed(RouteHelper.getMobileVerificationRoute()),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText('Already have an account? ',
                            color: AppColorConstant.appGrey, fontWeight: FontWeight.w400),
                        AppText('Login', color: AppColorConstant.appYellow, fontWeight: FontWeight.w400),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.px),
                  AppText('Terms and Conditions | Privacy policy', fontSize: 12.px, textAlign: TextAlign.center),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
