import 'dart:io';

import 'package:get/get.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/model/orders_model.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/utils.dart';

class OrdersController extends GetxController {
  OrdersModel? ordersModel;

  Future<void> getOrdersDetails(String statusCode) async {
    try {
      final response = await RestServices.instance.getRestCall(
        endpoint: RestConstants.instance.acceptedOrders,
        addOns: '/${AppStringConstants.storeLogInId}/status/$statusCode?page=0&size=20',
      );
      if (response != null && response.isNotEmpty) {
        ordersModel = ordersModelFromJson(response);
      }
      update();
    } on SocketException catch (e) {
      logs('Catch exception in getStoreProfile --> ${e.message}');
    }
  }
}
