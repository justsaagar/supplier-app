import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_tab_bar.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/payment_controller.dart';
import 'package:supplier/routes/route_helper.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PaymentController(),
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
        });
  }

  Widget buildCurrentScreen(currentIndex) {
    switch (currentIndex) {
      case 0:
        return const PaymentRequestScreen();
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
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 5),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: AppColorConstant.boxDecoration,
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: AppText('Mishra ram retailer',
                        maxLines: 2, fontWeight: FontWeight.w600, color: AppColorConstant.appBlack)),
                Row(
                  children: [
                    AppText('Status: ', fontSize: 12, color: AppColorConstant.appBlack),
                    AppText('Billed', fontWeight: FontWeight.w600, fontSize: 12, color: AppColorConstant.appBlack),
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
                titleAndSubTitleView('Balance', '₹ 3,030', fontColor: AppColorConstant.appRed),
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
                    onPressed: () =>
                        Get.toNamed(RouteHelper.getPaymentDetailsRoute(), parameters: {'isFullyPaid': 'false'}),
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
                    onPressed: () =>
                        Get.toNamed(RouteHelper.getPaymentDetailsRoute(), parameters: {'isFullyPaid': 'false'}),
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
      ),
    );
  }

  titleAndSubTitleView(String title, String subTitle, {Color fontColor = AppColorConstant.appBlack}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            '$title: ',
            fontSize: 12,
            color: AppColorConstant.appBlack,
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
      color: AppColorConstant.appBlack,
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
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 5),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: AppColorConstant.boxDecoration,
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: AppText('Mishra ram retailer',
                        maxLines: 2, fontWeight: FontWeight.w600, color: AppColorConstant.appBlack)),
                Row(
                  children: [
                    AppText('Status: ', fontSize: 12, color: AppColorConstant.appBlack),
                    AppText('Billed', fontWeight: FontWeight.w600, fontSize: 12, color: AppColorConstant.appBlack),
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
              onPressed: () => Get.toNamed(RouteHelper.getPaymentDetailsRoute(), parameters: {'isFullyPaid': 'true'}),
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
      ),
    );
  }
}

titleAndSubTitleView(String title, String subTitle, {Color fontColor = AppColorConstant.appBlack}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          '$title: ',
          fontSize: 11,
          color: AppColorConstant.appBlack,
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
