import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/payment_details_controller.dart';
import 'package:supplier/routes/route_helper.dart';
import 'package:supplier/screen/payment_screen/payment_screen.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Payments'),
      body: GetBuilder(
          init: PaymentDetailsController(),
          builder: (PaymentDetailsController paymentDetailsController) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: AppColorConstant.boxDecoration,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppText(
                          'Mishra ram retailer',
                          maxLines: 2,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Row(
                        children: [
                          AppText(
                            'Status: ',
                            fontSize: 12,
                          ),
                          AppText(
                            'Completed',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColorConstant.appGreen,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      titleAndSubTitleView('Order Id', '1234'),
                      titleAndSubTitleView('Order Date', '20/08/2022'),
                      titleAndSubTitleView('Order Amount', '₹ 9,634'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      titleAndSubTitleView('Billed Amount', '₹ 8,634', fontColor: AppColorConstant.appOrange),
                      titleAndSubTitleView('Amount Paid', '₹ 5,500', fontColor: AppColorConstant.appGreen),
                      paymentDetailsController.paramMap.containsKey('isFullyPaid') &&
                              paymentDetailsController.paramMap['isFullyPaid'] == 'true'
                          ? titleAndSubTitleView('Balance', '₹ 3,030', fontColor: AppColorConstant.appRed)
                          : const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const AppText(
                    'Complete Order Transactions',
                    fontSize: 11,
                    textAlign: TextAlign.center,
                    color: AppColorConstant.appGrey,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: paymentDetailsController.paramMap.containsKey('isFullyPaid') &&
                              paymentDetailsController.paramMap['isFullyPaid'] == 'true'
                          ? 2
                          : 4,
                      padding: const EdgeInsets.only(top: 10),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => transactionView(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (paymentDetailsController.paramMap.containsKey('isFullyPaid') &&
                      paymentDetailsController.paramMap['isFullyPaid'] != 'true')
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                            color: AppColorConstant.appGreen,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.done,
                            size: 15,
                            color: AppColorConstant.appWhite,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const AppText(
                          'Received Complete Payment',
                          fontSize: 12,
                          color: AppColorConstant.appGreen,
                        ),
                      ],
                    ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AppElevatedButton(
                      buttonName: 'Print Invoice',
                      imageString: AppAsset.printIcon,
                      onPressed: () => Get.toNamed(RouteHelper.getPrintInvoiceRoute()),
                      buttonRadius: 7,
                      fontSize: 14,
                      isIconShow: true,
                      borderColor: AppColorConstant.greyColor,
                      buttonColor: AppColorConstant.appBluest,
                      fontWeight: FontWeight.w500,
                      isBorderShape: true,
                      fontColor: AppColorConstant.greyColor,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  transactionView() {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColorConstant.appBottomBarGrey,
        ),
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                '20-08-20222',
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              AppText(
                '₹ 2500/-',
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppText(
                  'Trans ID ief64356456745',
                  color: AppColorConstant.appGrey,
                  fontSize: 9,
                ),
              ),
              Expanded(
                child: AppText(
                  'Payment Mode Debit Card',
                  color: AppColorConstant.appGrey,
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
