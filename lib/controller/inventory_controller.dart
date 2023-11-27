import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/model/inventory_stock_model.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/utils.dart';

class InventoryController extends GetxController {
  TextEditingController searchController = TextEditingController();
  num currentPage = 0;
  List<InventoryStockModel> allInventoryList = <InventoryStockModel>[];

  Future<void> getStoreInventory({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        allInventoryList.clear();
        currentPage = 0;
      } else {
        currentPage++;
      }
      final response = await RestServices.instance.getRestCall(
        endpoint: RestConstants.instance.storeInventory,
        addOns: '/${AppStringConstants.storeLogInId}?page=$currentPage&size=10',
      );
      if (response != null && response.isNotEmpty) {
        List<InventoryStockModel> list =  emptyFromJson(response);
        allInventoryList.addAll(list);
      }
    } on SocketException catch (e) {
      logs('Catch socketException in getStoreInventory --> ${e.message}');
    }
  }
}
