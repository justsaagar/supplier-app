import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_tab_bar.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/payment_controller.dart';
import 'package:supplier/model/payment_request_model.dart';
import 'package:supplier/routes/route_helper.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PaymentController(),
      initState: (state) {
        Future.delayed(
          const Duration(microseconds: 300),
          () {
            final paymentController = Get.find<PaymentController>();
            paymentController.getPaymentRequest(PaymentType.billedOrders);
          },
        );
      },
      builder: (PaymentController paymentController) {
        return Column(
          children: [
            AppTabBar(
              tabs: const ["Payment Request", "Fully Paid"],
              onTabChanged: (index) => paymentController.onTabChanged(index),
              currentIndex: paymentController.currentIndex,
            ),
            Expanded(child: buildCurrentScreen(paymentController.currentIndex)),
          ],
        );
      },
    );
  }

  Widget buildCurrentScreen(currentIndex) {
    switch (currentIndex) {
      case 1:
        return const FullyPaidScreen();
      default:
        return const PaymentRequestScreen();
    }
  }
}

class PaymentRequestScreen extends StatelessWidget {
  const PaymentRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (PaymentController paymentController) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 5),
          itemCount: paymentController.paymentRequestContent.length,
          itemBuilder: (BuildContext context, int index) {
            PaymentRequestContent paymentRequestModel =
                paymentController.paymentRequestContent[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: AppColorConstant.boxDecoration,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppText(
                          paymentRequestModel.payerName ?? '',
                          maxLines: 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          AppText('Status: ', fontSize: 12.px),
                          AppText(
                            paymentRequestModel.orderStatus ?? '',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
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
                        paymentRequestModel.orderId ?? '',
                      ),
                      titleAndSubTitleView(
                        'Order Date',
                        DateFormat('dd/MM/yyy').format(
                            paymentRequestModel.orderCreatedDate ??
                                DateTime.now()),
                      ),
                      titleAndSubTitleView(
                        'Order Amount',
                        '₹ ${paymentRequestModel.orderAmount ?? 0}',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      titleAndSubTitleView(
                        'Billed Amount',
                        '₹ ${paymentRequestModel.billedAmount ?? 0}',
                        fontColor: AppColorConstant.appOrange,
                      ),
                      titleAndSubTitleView(
                        'Amount Paid',
                        '₹ ${paymentRequestModel.amountPaid ?? 0}',
                        fontColor: AppColorConstant.appGreen,
                      ),
                      titleAndSubTitleView(
                        'Balance',
                        '₹ ${paymentRequestModel.balanceToBePaid ?? 0}',
                        fontColor: AppColorConstant.appRed,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 2,
                    color: AppColorConstant.appGrey.withOpacity(0.5),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: AppElevatedButton(
                          buttonName: 'Details',
                          onPressed: () {
                            paymentController.paymentHistoryByOrder(
                              orderId: paymentRequestModel.orderId ?? '',
                              payerId: paymentRequestModel.payerId ?? '',
                              storeId: paymentRequestModel.storeId ?? '',
                            );
                            Get.toNamed(
                              RouteHelper.getPaymentDetailsRoute(),
                              parameters: {'isFullyPaid': 'false'},
                            );
                          },
                          buttonHeight: 35,
                          buttonRadius: 5,
                          fontSize: 11,
                          borderColor: AppColorConstant.appGrey,
                          buttonColor: AppColorConstant.appBluest,
                          fontWeight: FontWeight.w500,
                          isBorderShape: true,
                          fontColor: AppColorConstant.appBluest,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: AppElevatedButton(
                          buttonName: 'Request Payment',
                          onPressed: () => paymentController.requestPayment(
                            orderId: paymentRequestModel.orderId ?? '',
                            billedAmount: paymentRequestModel.billedAmount ?? 0,
                            orderAmount: paymentRequestModel.orderAmount ?? 0,
                            paidAmount: paymentRequestModel.amountPaid ?? 0,
                            payerId: paymentRequestModel.payerId ?? '',
                            paymentId: paymentRequestModel.id ?? '',
                            storeId: paymentRequestModel.storeId ?? ''
                          ),
                          buttonHeight: 35,
                          buttonRadius: 5,
                          fontSize: 10,
                          buttonColor: AppColorConstant.appBluest,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  titleAndSubTitleView(String title, String subTitle,
      {Color fontColor = AppColorConstant.appBlack}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            '$title: ',
            fontSize: 12,
          ),
          const SizedBox(height: 2),
          AppText(
            subTitle,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: fontColor,
          )
        ],
      ),
    );
  }

  titleText(String title) {
    return AppText(
      '$title: ',
      fontSize: 12,
    );
  }

  subTitleText(String subTitle, {Color fontColor = Colors.black}) {
    return AppText(
      subTitle,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: fontColor,
    );
  }
}

class FullyPaidScreen extends StatelessWidget {
  const FullyPaidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (PaymentController paymentController) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 5),
          itemCount: paymentController.paymentRequestContent.length,
          itemBuilder: (BuildContext context, int index) {
            PaymentRequestContent paymentRequestModel =
                paymentController.paymentRequestContent[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: AppColorConstant.boxDecoration,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppText(
                          paymentRequestModel.payerName ?? '',
                          maxLines: 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          AppText('Status: ', fontSize: 12.px),
                          AppText(
                            paymentRequestModel.orderStatus ?? '',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
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
                        paymentRequestModel.orderId ?? '',
                      ),
                      titleAndSubTitleView(
                        'Order Date',
                        DateFormat('dd/MM/yyy').format(
                          paymentRequestModel.orderCreatedDate ??
                              DateTime.now(),
                        ),
                      ),
                      titleAndSubTitleView(
                        'Order Amount',
                        '₹ ${paymentRequestModel.orderAmount ?? 0}',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      titleAndSubTitleView(
                        'Billed Amount',
                        '₹ ${paymentRequestModel.billedAmount ?? 0}',
                        fontColor: AppColorConstant.appOrange,
                      ),
                      titleAndSubTitleView(
                        'Amount Paid',
                        '₹ ${paymentRequestModel.amountPaid ?? 0}',
                        fontColor: AppColorConstant.appGreen,
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 2,
                    color: AppColorConstant.appGrey.withOpacity(0.5),
                  ),
                  const SizedBox(height: 10),
                  AppElevatedButton(
                    onPressed: () => Get.toNamed(
                      RouteHelper.getPaymentDetailsRoute(),
                      parameters: {'isFullyPaid': 'true'},
                    ),
                    buttonName: 'Details',
                    buttonHeight: 35,
                    buttonRadius: 5,
                    fontSize: 12,
                    borderColor: AppColorConstant.appGrey,
                    buttonColor: AppColorConstant.appBluest,
                    fontWeight: FontWeight.w500,
                    isBorderShape: true,
                    fontColor: AppColorConstant.appBluest,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

titleAndSubTitleView(String title, String subTitle,
    {Color fontColor = AppColorConstant.appBlack}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          '$title: ',
          fontSize: 11,
        ),
        const SizedBox(height: 2),
        AppText(
          subTitle,
          fontWeight: FontWeight.w600,
          fontSize: 11.5,
          color: fontColor,
        )
      ],
    ),
  );
}
