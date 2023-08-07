import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/app_text_form_field.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/invoice_controller.dart';
import 'package:supplier/routes/route_helper.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Invoice'),
      body: GetBuilder(
          init: InVoiceController(),
          builder: (InVoiceController inVoiceController) {
            return ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 15),
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: VerticalTextFormField(
                          controller: inVoiceController.fromDateController,
                          hintText: '',
                          readOnly: true,
                          onTap: () => inVoiceController.selectDate(
                              context, inVoiceController.fromDate, inVoiceController.fromDateController),
                          isBorder: true,
                          filedColor: AppColorConstant.appWhite,
                          headerTitle: 'From',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: VerticalTextFormField(
                          controller: inVoiceController.toDateController,
                          hintText: '',
                          readOnly: true,
                          onTap: () => inVoiceController.selectDate(
                              context, inVoiceController.toDate, inVoiceController.toDateController),
                          isBorder: true,
                          filedColor: AppColorConstant.appWhite,
                          headerTitle: 'To',
                        ),
                      ),
                      SizedBox(width: 10.px),
                      const AppElevatedButton(
                        buttonName: 'Submit',
                        buttonColor: AppColorConstant.appBluest,
                        buttonHeight: 35,
                        buttonWidth: 70,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  color: AppColorConstant.appGrey.withOpacity(0.3),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        'Today, 04 Aug 22',
                        fontSize: 12,
                        color: AppColorConstant.appBlack,
                        fontWeight: FontWeight.w500,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              AppText(
                                'Items :',
                                color: AppColorConstant.appGrey,
                                fontSize: 12,
                              ),
                              AppText(
                                '119',
                                color: AppColorConstant.appBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AppText(
                                'Orders :',
                                color: AppColorConstant.appGrey,
                                fontSize: 12,
                              ),
                              AppText(
                                '119',
                                color: AppColorConstant.appBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AppText(
                                'Total :',
                                color: AppColorConstant.appGrey,
                                fontSize: 12,
                              ),
                              AppText(
                                '₹ 1,11,088',
                                color: AppColorConstant.appBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              'Mishra Enterprises',
                              fontWeight: FontWeight.w500,
                              color: AppColorConstant.appBlack,
                            ),
                            AppText(
                              '₹15,236',
                              fontWeight: FontWeight.w500,
                              color: AppColorConstant.appBlack,
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  '12:30pm | Masab tank, Hyderabad',
                                  color: AppColorConstant.appBlack,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        AppText('Items : ', color: AppColorConstant.appBlack),
                                        AppText('30', color: AppColorConstant.appBlack),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        AppText('Status : ', color: AppColorConstant.appBlack),
                                        AppText('Billed',
                                            color: AppColorConstant.appGreen, fontWeight: FontWeight.w500),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 25,
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColorConstant.appBlack),
                              ),
                              child: const AppText(
                                'Details',
                                color: AppColorConstant.appBlack,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          margin: const EdgeInsets.only(top: 10),
                          color: AppColorConstant.appGrey.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ),
                AppElevatedButton(
                  buttonName: 'Add New Invoice',
                  fontWeight: FontWeight.w500,
                  onPressed: ()=>Get.toNamed(RouteHelper.getAddNewInVoiceRoute()),
                  padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
                  buttonColor: AppColorConstant.appBluest,
                )
              ],
            );
          }),
    );
  }
}
