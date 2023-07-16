import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/app_text_form_field.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/plumster_asset.dart';
import 'package:supplier/controller/login_controller.dart';
import 'package:supplier/utils/utils.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (LoginController loginController) {
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
                  AppImageAsset(image: AppAsset.loginImage, height: 246.px),
                  SizedBox(height: 36.px),
                  AppTextFormField(
                    controller: loginController.usernameController,
                    headerTitle: 'User Name',
                    hintText: 'E-mail address / User ID',
                  ),
                  SizedBox(height: 16.px),
                  AppTextFormField(
                    controller: loginController.passwordController,
                    headerTitle: 'Password',
                    hintText: 'Enter Password',
                  ),
                  SizedBox(height: 6.px),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppText(
                      'Forgot Password ?',
                      fontSize: 10.px,
                      fontWeight: FontWeight.w500,
                      color: AppColorConstant.lightGreyColor.withOpacity(0.19),
                    ),
                  ),
                  SizedBox(height: 50.px),
                  const AppElevatedButton(buttonName: 'Login'),
                  SizedBox(height: 18.px),
                  AppText(
                    'Or',
                    fontSize: 24.px,
                    fontWeight: FontWeight.w500,
                    color: AppColorConstant.appWhite,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 18.px),
                  AppElevatedButton(
                    buttonName: 'Continue with OTP',
                    fontColor: AppColorConstant.appYellow,
                    buttonColor: AppColorConstant.lightGreyColor.withOpacity(0.19),
                  ),
                  SizedBox(height: 50.px),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText('New to LOCAL ? ', color: AppColorConstant.appGrey, fontWeight: FontWeight.w400),
                      AppText('Register', color: AppColorConstant.appYellow, fontWeight: FontWeight.w400),
                    ],
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
