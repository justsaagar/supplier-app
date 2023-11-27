import 'dart:io';

import 'package:get/get.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/model/orders_model.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/utils.dart';

class OrdersController extends GetxController {
  List<OrdersContent> ordersContent = <OrdersContent>[];
  int currentIndex = 0;
  int currentPage = 0;
  bool isLoading = false;

  Future<void> getOrdersDetails(String statusCode, {bool isRefresh = true}) async {
    isLoading = true;
    update();
    if (isRefresh) {
      ordersContent.clear();
      currentPage = 0;
    } else {
      currentPage++;
    }
    try {
      final String? response = await RestServices.instance.getRestCall(
        endpoint: RestConstants.instance.acceptedOrders,
        addOns: '/${AppStringConstants.storeLogInId}/status/$statusCode?page=$currentPage&size=20',
      );
      if (response != null && response.isNotEmpty) {
        OrdersModel ordersModel = ordersModelFromJson(response);
        if (!ordersModel.empty){
          ordersContent.addAll(ordersModel.ordersContent);
        }
      }
      update();
    } on SocketException catch (e) {
      logs('Catch exception in getOrdersDetails --> ${e.message}');
    }
  }
}
