import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/orders_controller.dart';
import 'package:supplier/routes/route_helper.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Device.width * 0.7,
      decoration: BoxDecoration(
        color: AppColorConstant.appWhite,
        borderRadius: BorderRadius.circular(12.px),
      ),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 12.px),
          children: [
            buildDrawerOptions('New orders', '5'),
            buildDrawerOptions('Viewed', '7'),
            buildDrawerOptions('Accepted', '5'),
            buildDrawerOptions('Billed', '5'),
            buildDrawerOptions('Paid', '5'),
            buildDrawerOptions('Packed', '5'),
            buildDrawerOptions('Delivery in process', '5'),
            buildDrawerOptions('Delivered', '5'),
            buildDrawerOptions('Rejected', '5'),
            buildDrawerOptions('Cancelled', '5'),
          ],
        ),
      ),
    );
  }

  buildDrawerOptions(String name, String count) {
    return GetBuilder<OrdersController>(
      init: OrdersController(),
      builder: (OrdersController ordersController) {
        return InkWell(
          onTap: () async {
            await ordersController.getOrdersDetails(getIdByName(name));
            Get.toNamed(RouteHelper.getManageOrdersRoute(), parameters: {'pageName': name});
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.px),
                child: Row(
                  children: [
                    AppText(
                      '$name ',
                      color: AppColorConstant.appBluest,
                      fontSize: 18.px,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText('($count)', color: AppColorConstant.appOrange, fontWeight: FontWeight.w500),
                    const Spacer(),
                    const AppImageAsset(image: AppAsset.rightChevronIcon)
                  ],
                ),
              ),
              Container(
                height: 1.px,
                decoration: const BoxDecoration(color: AppColorConstant.appBottomBarGrey),
              ),
            ],
          ),
        );
      }
    );
  }

  String getIdByName(String name) {
    switch (name) {
      case 'New orders':
        return '0';
      case 'Accepted':
        return '1';
      case 'Billed':
        return '2';
      case 'Packed':
        return '5';
      case 'Rejected':
      case 'Cancelled':
        return '3';
      default:
        return '0';
    }
  }
}
