import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/common_primary_button.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/bank_controller.dart';

class SocialOtpVerificationScreen extends StatelessWidget {
  final String phoneController;

  const SocialOtpVerificationScreen({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: GetBuilder<BankDetailsController>(
        builder: (BankDetailsController bankDetailsController) {
          return Stack(
            children: [
              AppImageAsset(image: 'assets/images/bg.png', height: height, width: width, fit: BoxFit.cover),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          AppText("OTP has been sent to\n$phoneController", textAlign: TextAlign.center),
                          SizedBox(height: height * 0.02),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.px),
                            child: Pinput(
                              controller: bankDetailsController.otpController,
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
                          SizedBox(height: height * 0.03),
                          // if (controller.timer != null && controller.timer!.isActive)
                          //   Center(
                          //     child: CommonText(
                          //       content: "00:${controller.timerValue.value.toString().padLeft(2, '0')}",
                          //       boldNess: FontWeight.w400,
                          //     ),
                          //   ),
                          // SizedBox(height: height * 0.03),
                          // if (controller.timer == null || !controller.timer!.isActive)
                          //   InkWell(
                          //     onTap: () {
                          //       otpController.getOtp("resend");
                          //       controller.manageTimer();
                          //     },
                          //     child: Column(
                          //       children: [
                          //         Center(
                          //           child: CommonText(
                          //             content: "Didn’t receive it?",
                          //             boldNess: FontWeight.w400,
                          //             textColor: AppColors.primaryColor,
                          //           ),
                          //         ),
                          //         SizedBox(height: height * 0.04),
                          //         const Center(
                          //           child: CommonText(
                          //             content: "Resend OTP",
                          //             boldNess: FontWeight.w400,
                          //           ),
                          //         ),
                          //         SizedBox(height: height * 0.03),
                          //       ],
                          //     ),
                          //   ),
                          // controller.isVerified == true
                          //     ? Center(
                          //         child: Container(
                          //           height: 35,
                          //           width: width / 3.8,
                          //           decoration: BoxDecoration(
                          //             color: Colors.green,
                          //             borderRadius: BorderRadius.circular(5),
                          //           ),
                          //           child: Center(
                          //             child: Row(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: [
                          //                 const CircleAvatar(
                          //                   radius: 10,
                          //                   backgroundColor: Colors.white,
                          //                   child: Center(
                          //                     child: Icon(
                          //                       Icons.done,
                          //                       color: Colors.green,
                          //                       size: 10,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 CommonText(
                          //                   content: "  Verified",
                          //                   textColor: Colors.white,
                          //                   textSize: width * 0.03,
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       )
                          //     : controller.isVerified == null
                          //         ? const SizedBox()
                          //         : Center(
                          //             child: Container(
                          //               height: 35,
                          //               width: width / 3.8,
                          //               decoration: BoxDecoration(
                          //                 color: Colors.white,
                          //                 borderRadius: BorderRadius.circular(5),
                          //               ),
                          //               child: Center(
                          //                 child: Row(
                          //                   mainAxisSize: MainAxisSize.min,
                          //                   children: [
                          //                     const Icon(
                          //                       Icons.error,
                          //                       color: Colors.red,
                          //                     ),
                          //                     CommonText(
                          //                       content: " Invalid OTP",
                          //                       textColor: Colors.red,
                          //                       textSize: width * 0.03,
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !keyboardIsOpen,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: CommonPrimaryButton(
                        isLoading: false,
                        text: 'Verify Now',
                        onTap: () async => await bankDetailsController.verifyPhoneNumber(phoneController),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
