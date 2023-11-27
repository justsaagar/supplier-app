import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:supplier/model/orders_model.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/utils.dart';

class PrintInvoiceController extends GetxController {
  bool isLoading = true;
  OrdersContent? ordersContent;

  Future<void> getOrderDetails() async {
    isLoading = true;
    update();
    try {
      final Map<String, dynamic> getParameter = Get.parameters;
      logs('Get params --> $getParameter');
      final String? response = await RestServices.instance.getRestCall(
        endpoint: RestConstants.instance.orderDetails,
        addOns: '/${getParameter['orderId']}/store/${getParameter['storeId']}'
      );
      if (response != null && response.isNotEmpty) {
        ordersContent = OrdersContent.fromJson(jsonDecode(response));
      }
    } on SocketException catch (e) {
      logs('Catch SocketException in getOrderDetails --> ${e.message}');
    }
    isLoading = false;
    update();
  }
}
