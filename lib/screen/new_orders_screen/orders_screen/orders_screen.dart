import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/new_orders_controller.dart';
import 'package:supplier/controller/orders_controller.dart';
import 'package:supplier/model/orders_model.dart';
import 'package:supplier/routes/route_helper.dart';

class ManageOrdersScreen extends StatelessWidget {
  const ManageOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
      init: OrdersController(),
      builder: (OrdersController ordersController) {
        return Scaffold(
          appBar: AppAppBar(
            title: Get.parameters.isNotEmpty && Get.parameters.containsKey('pageName')
                ? (Get.parameters['pageName'] ?? '')
                : '',
            showSuffix: true,
          ),
          body: ordersController.ordersContent.isEmpty
              ? Center(
                  child: AppText(
                    'No orders found',
                    color: AppColorConstant.appBluest,
                    fontSize: 16.px,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  itemCount: ordersController.ordersContent.length,
                  itemBuilder: (context, index) {
                    OrdersContent ordersContent = ordersController.ordersContent[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                'Order #${ordersContent.id ?? ''}',
                                fontWeight: FontWeight.w500,
                              ),
                              AppText(
                                DateFormat('hh:mm a').format(
                                  ordersContent.orderCreatedDate ??
                                      DateTime.now(),
                                ),
                                fontWeight: FontWeight.w500,
                              ),
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
                                      ordersContent.storeName ?? '',
                                      maxLines: 2,
                                    ),
                                    AppText('Items : ${ordersContent.items.length}'),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Expanded(
                                child: AppElevatedButton(
                                  buttonName: 'Accept',
                                  buttonHeight: 35,
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
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      color: AppColorConstant.appGrey.withOpacity(0.7),
                    );
                  },
                ),
        );
      },
    );
  }
}
