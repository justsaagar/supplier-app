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

class NewOrdersScreen extends StatelessWidget {
  const NewOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NewOrdersController(),
      builder: (NewOrdersController newOrdersController) {
        return Scaffold(
          key: newOrdersController.scaffoldKey,
          appBar: AppAppBar(title: 'New Orders', showSuffix: true),
          drawer: const AppDrawer(),
          body: Column(
            children: [
              AppTabBar(
                tabs: const ["New Orders",     "Accepted Orders"],
                onTabChanged: (index) => newOrdersController.onTabChanged(index),
                currentIndex: newOrdersController.currentIndex,
              ),
              Expanded(
                child: NewAndAcceptedOrdersTab(isAcceptedOrder: newOrdersController.currentIndex != 1 ? false : true),
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

  const NewAndAcceptedOrdersTab({Key? key, this.isAcceptedOrder = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      separatorBuilder: (context, index) => Container(
        height: 1,
        color: AppColorConstant.appGrey.withOpacity(0.7),
      ),
      itemBuilder: (context, index) => Container(
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
                Expanded(
                  child: AppElevatedButton(
                    buttonName: isAcceptedOrder ? 'Bill' : 'Review',
                    buttonHeight: 35,
                    onPressed: () => Get.toNamed(RouteHelper.getManageOrdersRoute()),
                    fontWeight: FontWeight.w400,
                    buttonColor: AppColorConstant.appBluest,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}