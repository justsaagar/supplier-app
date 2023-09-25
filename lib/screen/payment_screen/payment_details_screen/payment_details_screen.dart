import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/payment_controller.dart';
import 'package:supplier/model/payment_details_model.dart';
import 'package:supplier/routes/route_helper.dart';
import 'package:supplier/screen/payment_screen/payment_screen.dart';
import 'package:supplier/utils/utils.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return Scaffold(
      appBar: AppAppBar(title: 'Payments'),
      body: GetBuilder<PaymentController>(
        init: PaymentController(),
        builder: (PaymentController paymentDetailsController) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: AppColorConstant.boxDecoration,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppText(
                        paymentDetailsController.paymentDetailsModel?.userName ?? '',
                        maxLines: 2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        const AppText('Status: ', fontSize: 12),
                        AppText(
                          paymentDetailsController.paymentDetailsModel?.orderStatus ?? '',
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
                    titleAndSubTitleView(
                      'Order Id',
                      paymentDetailsController.paymentDetailsModel?.orderId ?? '',
                    ),
                    titleAndSubTitleView(
                      'Order Date',
                      DateFormat('dd/MM/yyy').format(
                        paymentDetailsController.paymentDetailsModel?.orderDate ?? DateTime.now(),
                      ),
                    ),
                    titleAndSubTitleView('Order Amount', '₹ ${paymentDetailsController.paymentDetailsModel?.orderAmount ?? 0}'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    titleAndSubTitleView(
                      'Billed Amount',
                      '₹ ${paymentDetailsController.paymentDetailsModel?.billedAmount ?? 0}',
                      fontColor: AppColorConstant.appOrange,
                    ),
                    titleAndSubTitleView(
                      'Amount Paid',
                      '₹ ${paymentDetailsController.paymentDetailsModel?.paidAmount ?? 0}',
                      fontColor: AppColorConstant.appGreen,
                    ),
                    (paymentDetailsController.paymentDetailsModel?.fullyPaid ?? false)
                        ? titleAndSubTitleView(
                            'Balance',
                            '₹ ${paymentDetailsController.paymentDetailsModel?.balanceTobePaid ?? 0}',
                            fontColor: AppColorConstant.appRed,
                          )
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
                  child: ListView.separated(
                    itemCount: paymentDetailsController.paymentDetailsModel?.paymentInfo.length ?? 0,
                    padding: const EdgeInsets.only(top: 10, left: 6, right: 6),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return transactionView(
                        paymentDetailsController.paymentDetailsModel?.paymentInfo[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                  ),
                ),
                const SizedBox(height: 10),
                if (paymentDetailsController.paymentDetailsModel?.fullyPaid ?? false)
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
        },
      ),
    );
  }

  Container transactionView(PaymentInfo? paymentInfo) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColorConstant.appBottomBarGrey,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                DateFormat('dd-MM-yyyy').format(paymentInfo?.paidDate ?? DateTime.now()),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              AppText(
                '₹ ${paymentInfo?.paidAmount ?? 0}/-',
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppText(
                  'Trans ID ${paymentInfo?.paymentId ?? ''}',
                  color: AppColorConstant.appGrey,
                  fontSize: 9,
                ),
              ),
              Expanded(
                child: AppText(
                  'Payment Mode : ${paymentInfo?.paymentMode ?? ''}',
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
