import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/screen/dashboard_module/home/analytics_screen/analytics_screen.dart';
import 'package:supplier/screen/delivery_screen/delivery_rider_screen.dart';
import 'package:supplier/screen/inventory_screen/inventory_screen.dart';
import 'package:supplier/screen/invoice_screen/invoice_screen.dart';
import 'package:supplier/screen/new_orders_screen/manage_order_screen.dart';
import 'package:supplier/screen/retailers_screen/retailers_screen.dart';
import 'package:supplier/screen/subscription/subscription_screen.dart';
import '../screen/bank_screen/bank_screen.dart';

class HomeController extends GetxController {
  PageController controller = PageController();
  final BehaviorSubject<int> buyingGuidesController = BehaviorSubject<int>();
  List<Map<String, dynamic>> homeOptions = [
    {'image': AppAsset.newOrders, 'name': 'New orders', 'pageName': const ManageOrderScreen()},
    {'image': AppAsset.analysis, 'name': 'Analytics', 'pageName': const AnalyticsScreen()},
    {'image': AppAsset.retailers, 'name': 'Retailers', 'pageName': const RetailersScreen()},
    {'image': AppAsset.inventory, 'name': 'Inventory', 'pageName': const InventoryScreen()},
    {'image': AppAsset.invoice, 'name': 'Invoice', 'pageName': const InvoiceScreen()},
    {'image': AppAsset.bank, 'name': 'Bank detail', 'pageName': const BankScreen()},
    {'image': AppAsset.delivery, 'name': 'Rider',  'pageName': const DeliveryRiderScreen()},
    {'image': AppAsset.products, 'name': 'Product Subscription', 'pageName': const SubscriptionScreen()},
  ];
}
