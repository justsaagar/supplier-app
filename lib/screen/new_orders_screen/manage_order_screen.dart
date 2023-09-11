import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_drawer.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_tab_bar.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/new_orders_controller.dart';
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
              NewAndAcceptedOrdersTab(isAcceptedOrder: newOrdersController.currentIndex == 1),
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
    return Expanded(
      child: ListView.separated(
        itemCount: newOrdersController.allOrdersModelList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText('Order #253641', fontWeight: FontWeight.w500),
                    AppText('2:05 pm', fontWeight: FontWeight.w500),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'Suresh Store Ramnagar,Manikonda',
                            maxLines: 2,
                          ),
                          Row(
                            children: [
                              AppText('Items : '),
                              AppText('25'),
                            ],
                          ),
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
      ),
    );
  }
}
