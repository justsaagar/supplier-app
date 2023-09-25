import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/new_orders_controller.dart';

class ManageOrdersScreen extends StatelessWidget {
  const ManageOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NewOrdersController(),
      initState: (_) {
        Future.delayed(
          const Duration(microseconds: 300),
          () {
            final newOrdersController = Get.find<NewOrdersController>();
            newOrdersController.manageOrderMap = Get.parameters;
            newOrdersController.update();
          },
        );
      },
      builder: (NewOrdersController newOrdersController) {
        return Scaffold(
          appBar: AppAppBar(
            title: newOrdersController.manageOrderMap.isNotEmpty && newOrdersController.manageOrderMap.containsKey('pageName')
                ? newOrdersController.manageOrderMap['pageName']
                : '',
            showSuffix: true,
          ),
          body: ListView.separated(
            itemCount: 5,
            shrinkWrap: true,
            separatorBuilder: (context, index) => Container(
              height: 1,
              color: AppColorConstant.appGrey.withOpacity(0.7),
            ),
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText('Order #253641', fontWeight: FontWeight.w500),
                      AppText('2:05 pm', fontWeight: FontWeight.w500),
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
            ),
          ),
        );
      },
    );
  }
}
