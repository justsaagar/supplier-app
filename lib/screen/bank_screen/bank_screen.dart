import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/app_text_form_field.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/bank_controller.dart';
import 'package:supplier/utils/string_extensions.dart';
import 'package:supplier/utils/validation_utils.dart';

class BankScreen extends StatelessWidget {
  const BankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Bank details'),
      body: GetBuilder(
        init: BankDetailsController(),
        builder: (BankDetailsController controller) {
          return Container(
            color: AppColorConstant.lightWhite,
            child: ListView(
              children: [
                Container(
                  height: 60.px,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 10.px),
                  child: AppText(
                    'Bank details',
                    fontSize: 25.px,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColorConstant.appWhite,
                      borderRadius: BorderRadius.all(Radius.circular(10.px))),
                  margin: EdgeInsets.all(10.px),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.px,
                            bottom: 5.px,
                            right: 10.px,
                            left: 10.px),
                        child: AppTextFormField(
                          isBorder: true,
                          controller: controller.accountNameController,
                          filedColor: AppColorConstant.appWhite,
                          hintText: 'Enter account holder name',
                          headerTitle: 'Enter account holder name',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.px,
                            bottom: 5.px,
                            right: 10.px,
                            left: 10.px),
                        child: AppTextFormField(
                          isBorder: true,
                          isNumber: true,
                          keyboardType: TextInputType.number,
                          controller: controller.accountNumberController,
                          hintText: 'Enter account number',
                          filedColor: AppColorConstant.appWhite,
                          headerTitle: 'Enter account number',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.px,
                            bottom: 5.px,
                            right: 10.px,
                            left: 10.px),
                        child: AppTextFormField(
                          isBorder: true,
                          controller: controller.ifscController,
                          hintText: 'Enter IFSC number',
                          filedColor: AppColorConstant.appWhite,
                          headerTitle: 'Enter IFSC number',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.px,
                            bottom: 5.px,
                            right: 10.px,
                            left: 10.px),
                        child: AppTextFormField(
                          isBorder: true,
                          filedColor: AppColorConstant.appWhite,
                          controller: controller.bankBranchController,
                          hintText: 'Enter branch name',
                          headerTitle: 'Enter branch name',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.px,
                            bottom: 5.px,
                            right: 10.px,
                            left: 10.px),
                        child: AppTextFormField(
                          filedColor: AppColorConstant.appWhite,
                          isBorder: true,
                          controller: controller.bankNameController,
                          hintText: 'Enter bank name',
                          headerTitle: 'Enter bank name',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.px,
                            bottom: 5.px,
                            right: 10.px,
                            left: 10.px),
                        child: Row(
                          children: [
                            Expanded(
                              child: AppTextFormField(
                                filedColor: AppColorConstant.appWhite,
                                isBorder: true,
                                isNumber: true,
                                length: 10,
                                controller: controller.googlePayController,
                                keyboardType: TextInputType.number,
                                hintText: 'Enter google pay number',
                                headerTitle: 'Enter google pay number',
                              ),
                            ),
                            (controller.googlePayVerified == false)
                                ? AppText('')
                                : Container(
                                    margin: EdgeInsets.only(
                                        top: 24.px, left: 5.px),
                                    width: 100.px,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.px),
                                      color: AppColorConstant.appChartGreen,
                                    ),
                                    alignment: Alignment.center,
                                    height: 45.px,
                                    child: AppText('Verify',
                                        fontSize: 18.px,
                                        color: AppColorConstant.appWhite),
                                  ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.px,
                            bottom: 5.px,
                            right: 10.px,
                            left: 10.px),
                        child: Row(
                          children: [
                            Expanded(
                              child: AppTextFormField(
                                filedColor: AppColorConstant.appWhite,
                                isBorder: true,
                                isNumber: true,
                                length: 10,
                                controller: controller.phonePayController,
                                hintText: 'Enter phone pay number',
                                keyboardType: TextInputType.number,
                                headerTitle: 'Enter phone pay number',
                              ),
                            ),
                            (controller.phonePayVerified == false)
                                ? AppText('')
                                : Container(
                                    margin: EdgeInsets.only(
                                        top: 24.px, left: 5.px),
                                    width: 100.px,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.px),
                                      color: AppColorConstant.appChartGreen,
                                    ),
                                    alignment: Alignment.center,
                                    height: 45.px,
                                    child: AppText('Verify',
                                        fontSize: 18.px,
                                        color: AppColorConstant.appWhite),
                                  ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.px,
                            bottom: 5.px,
                            right: 10.px,
                            left: 10.px),
                        child: Row(
                          children: [
                            Expanded(
                              child: AppTextFormField(
                                length: 10,
                                isBorder: true,
                                filedColor: AppColorConstant.appWhite,
                                isNumber: true,
                                controller: controller.paytmController,
                                keyboardType: TextInputType.number,
                                hintText: 'Enter paytm number',
                                headerTitle: 'Enter paytm number',
                              ),
                            ),
                            (controller.paytmVerified == false)
                                ? AppText('')
                                : Container(
                                    margin: EdgeInsets.only(
                                        top: 24.px, left: 5.px),
                                    width: 100.px,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.px),
                                      color: AppColorConstant.appChartGreen,
                                    ),
                                    alignment: Alignment.center,
                                    height: 45.px,
                                    child: AppText('Verify',
                                        fontSize: 18.px,
                                        color: AppColorConstant.appWhite),
                                  ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.validateBankDetailsForm();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10.px),
                          alignment: Alignment.center,
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColorConstant.appYellow,
                              borderRadius: BorderRadius.circular(10.px)),
                          child: AppText('Save',
                              fontSize: 20.px,
                              color: AppColorConstant.appWhite),
                        ),
                      ),
                      SizedBox(
                        height: 10.px,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
