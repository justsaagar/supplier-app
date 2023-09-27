import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/utils.dart';

class InventoryController extends GetxController {
  TextEditingController searchController = TextEditingController();
  num currentPage = 0;
  List allInventoryList = [];

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
        addOns: '?page=$currentPage&size=10',
      );
      if (response != null && response.isNotEmpty) {}
    } on SocketException catch (e) {
      logs('Catch socketException in getStoreInventory --> ${e.message}');
    }
  }
}
