import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/controller/login_controller.dart';
import 'package:supplier/routes/route_helper.dart';
import 'package:supplier/utils/utils.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController(),
        initState: (state) {
          Future.delayed(
            const Duration(microseconds: 300),
            () {
              final loginController = Get.find<LoginController>();
              loginController.manageTimer();
            },
          );
        },
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
              SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 28.px),
                  children: [
                    SizedBox(height: 22.px),
                    Align(alignment: Alignment.centerLeft, child: AppImageAsset(image: AppAsset.backIcon, height: 18.px)),
                    SizedBox(height: 34.px),
                    AppText(
                      'ONE FINAL STEP...',
                      fontSize: 30.px,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 100.px),
                    AppText(
                      ' OTP has been sent to\n${loginController.mobileNumberController.text}',
                      fontWeight: FontWeight.w700,
                      fontSize: 18.px,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.px),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.px),
                      child: Pinput(
                        controller: loginController.otpController,
                        length: 6,
                        androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: false,
                        defaultPinTheme: PinTheme(
                          height: 50.px,
                          width: 50.px,
                          decoration: BoxDecoration(
                            color: AppColorConstant.lightGreyColor.withOpacity(0.19),
                            borderRadius: BorderRadius.circular(10.px),
                          ),
                          textStyle: TextStyle(
                            fontSize: 20.px,
                            color: AppColorConstant.appWhite,
                          ),
                        ),
                      ),
                    ),
                    if (loginController.timerValue > 0) ...[
                      SizedBox(height: 36.px),
                      AppText(
                        '00:${loginController.timerValue.toStringAsFixed(0).padLeft(2, '0')}',
                        fontSize: 24.px,
                        color: AppColorConstant.appWhite,
                        textAlign: TextAlign.center,
                      ),
                    ],
                    if (loginController.timerValue == 0) ...[
                      SizedBox(height: 48.px),
                      AppText(
                        'Didn’t receive it?',
                        fontSize: 18.px,
                        color: AppColorConstant.appOrange,
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () => loginController.manageTimer(),
                        child: AppText(
                          'Resend OTP',
                          fontSize: 18.px,
                          color: AppColorConstant.appWhite,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ],
                ),
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
              buttonName: 'Verify Now',
              fontSize: 20.px,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              onPressed: () => Get.toNamed(RouteHelper.getPendingVerificationRoute()),
            ),
            SizedBox(height: 20.px),
            AppText('Terms and Conditions',
                color: AppColorConstant.appWhite, fontWeight: FontWeight.w500, fontSize: 12.px),
            AppText('Privacy policy', color: AppColorConstant.appWhite, fontWeight: FontWeight.w500, fontSize: 12.px),
            SizedBox(height: 20.px),
          ],
        ),
      ),
    );
  }
}
