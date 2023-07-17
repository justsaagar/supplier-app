import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/app_text_form_field.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/controller/login_controller.dart';
import 'package:supplier/routes/route_helper.dart';
import 'package:supplier/utils/utils.dart';

class MobileVerificationScreen extends StatelessWidget {
  const MobileVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController() ,
        builder: (LoginController loginController) {
          return Stack(
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
                  AppImageAsset(image: AppAsset.mobileVerificationImage, height: 160.px),
                  SizedBox(height: 60.px),
                  AppTextFormField(
                    controller: loginController.mobileNumberController,
                    hintText: 'Mobile number',
                    headerTitle: 'Enter mobile number',
                    prefixIcon: IntlPhoneField(
                      flagsButtonMargin: EdgeInsets.zero,
                      onCountryChanged: (Country value) => loginController.onCountryChange(value),
                      initialCountryCode: 'IN',
                      showDropdownIcon: false,
                      showCountryFlag: false,
                      validator: (p0) => null,
                      readOnly: true,
                      style: TextStyle(
                        fontFamily: AppAsset.defaultFont,
                        fontSize: 14.px,
                        fontWeight: FontWeight.w600,
                        color: AppColorConstant.appRed,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        prefixIcon: const SizedBox(),
                        prefixStyle: TextStyle(
                          fontFamily: AppAsset.defaultFont,
                          fontSize: 14.px,
                          fontWeight: FontWeight.w600,
                          color: AppColorConstant.appRed,
                        ),
                        labelStyle: TextStyle(
                          fontFamily: AppAsset.defaultFont,
                          fontSize: 14.px,
                          fontWeight: FontWeight.w600,
                          color: AppColorConstant.appWhite,
                        ),
                        suffixIconConstraints: BoxConstraints(minHeight: 2.px, minWidth: 4.px),
                        suffixIcon: const SizedBox(),
                        contentPadding: EdgeInsets.zero,
                        counterText: '',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: AppColorConstant.darkBlue),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppElevatedButton(
              buttonName: 'Continue',
              fontSize: 20.px,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              onPressed: () => Get.toNamed(RouteHelper.getOtpVerificationRoute()),
            ),
            SizedBox(height: 20.px),
            AppText('By continuing, you agree to our', color: AppColorConstant.appWhite, fontWeight: FontWeight.w500, fontSize: 12.px),
            AppText('Terms and Conditions | Privacy policy', color: AppColorConstant.appWhite, fontWeight: FontWeight.w500, fontSize: 12.px),
            SizedBox(height: 20.px),
          ],
        ),
      ),
    );
  }
}
