import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/model/orders_model.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/utils.dart';

class NewOrdersController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  Map<String, dynamic> manageOrderMap = {};
  List<OrdersContent> allOrdersModelList = <OrdersContent>[];
  int currentPage = 0;
  bool isLoading = false;

  Future<void> onTabChanged(index) async {
    currentIndex = index;
    update();
    await getAllOrders(index);
  }

  Future<void> getAllOrders(int orderType, {bool isRefresh = true}) async {
    isLoading = true;
    update();
    if (isRefresh) {
      allOrdersModelList.clear();
      currentPage = 0;
    } else {
      currentPage++;
    }
    try {
      final response = await RestServices.instance.getRestCall(
        endpoint: RestConstants.instance.allOrders,
        addOns: '/${AppStringConstants.storeLogInId}/status/$orderType?size=10&page=$currentPage',
      );
      if (response != null && response.isNotEmpty) {
        OrdersModel allOrdersModel = ordersModelFromJson(response);
        allOrdersModelList.addAll(allOrdersModel.ordersContent);
      }
    } on SocketException catch (e) {
      logs('Catch socketException in getAllOrders --> ${e.message}');
    }
    isLoading = false;
    update();
  }
}
