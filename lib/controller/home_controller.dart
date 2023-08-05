import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/screen/dashboard_module/home/analytics_screen/analytics_screen.dart';
import 'package:supplier/screen/inventory_screen/inventory_screen.dart';

class HomeController extends GetxController {
  PageController controller = PageController();
  final BehaviorSubject<int> buyingGuidesController = BehaviorSubject<int>();
  List<Map<String, dynamic>> homeOptions = [
    {'image': AppAsset.newOrders, 'name': 'New orders', 'pageName': const AnalyticsScreen()},
    {'image': AppAsset.analysis, 'name': 'Analytics', 'pageName': const AnalyticsScreen()},
    {'image': AppAsset.retailers, 'name': 'Retailers', 'pageName': const AnalyticsScreen()},
    {'image': AppAsset.inventory, 'name': 'Inventory', 'pageName': const InventoryScreen()},
    {'image': AppAsset.invoice, 'name': 'Invoice', 'pageName': const AnalyticsScreen()},
  ];
}
