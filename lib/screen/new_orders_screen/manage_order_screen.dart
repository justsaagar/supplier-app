import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_drawer.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_loader.dart';
import 'package:supplier/app/widget/app_tab_bar.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/new_orders_controller.dart';
import 'package:supplier/model/orders_model.dart';
import 'package:supplier/routes/route_helper.dart';

class ManageOrderScreen extends StatelessWidget {
  const ManageOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NewOrdersController(),
      initState: (state) {
        Future.delayed(
          const Duration(microseconds: 300),
          () {
            final newOrdersController = Get.find<NewOrdersController>();
            newOrdersController.getAllOrders(0);
          },
        );
      },
      builder: (NewOrdersController newOrdersController) {
        return Scaffold(
          key: newOrdersController.scaffoldKey,
          appBar: AppAppBar(title: 'New Orders', showSuffix: true),
          drawer: const AppDrawer(),
          body: Column(
            children: [
              AppTabBar(
                tabs: const ['New Orders', 'Accepted Orders'],
                onTabChanged: (index) => newOrdersController.onTabChanged(index),
                currentIndex: newOrdersController.currentIndex,
              ),
              Expanded(
                child: Stack(
                  children: [
                    NewAndAcceptedOrdersTab(isAcceptedOrder: newOrdersController.currentIndex == 1),
                    if (newOrdersController.isLoading) const AppLoader(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NewAndAcceptedOrdersTab extends StatelessWidget {
  final bool isAcceptedOrder;

  NewAndAcceptedOrdersTab({Key? key, this.isAcceptedOrder = false}) : super(key: key);

  final newOrdersController = Get.find<NewOrdersController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: newOrdersController.allOrdersModelList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        OrdersContent allOrders = newOrdersController.allOrdersModelList[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText('Order #${allOrders.id ?? ''}', fontWeight: FontWeight.w500),
                  AppText(DateFormat('hh:mm a').format(allOrders.orderCreatedDate ?? DateTime.now()), fontWeight: FontWeight.w500),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          allOrders.storeName ?? '',
                          maxLines: 2,
                        ),
                        AppText('Items : ${allOrders.items.length}'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AppElevatedButton(
                      buttonName: isAcceptedOrder ? 'Bill' : 'Review',
                      buttonHeight: 35,
                      onPressed: () =>
                          Get.toNamed(RouteHelper.getReviewOrderRoute()),
                      fontWeight: FontWeight.w400,
                      buttonColor: AppColorConstant.appBluest,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => Container(
        height: 1,
        color: AppColorConstant.appGrey.withOpacity(0.7),
      ),
    );
  }
}
