import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supplier/constant/app_asset.dart';

class HomeController extends GetxController {
  PageController controller = PageController();
  final BehaviorSubject<int> buyingGuidesController = BehaviorSubject<int>();
  List<Map<String, dynamic>> homeOptions = [
    {'image': AppAsset.newOrders, 'name': 'New orders'},
    {'image': AppAsset.analysis, 'name': 'Analytics'},
    {'image': AppAsset.retailers, 'name': 'Retailers'},
    {'image': AppAsset.inventory, 'name': 'Inventory'},
    {'image': AppAsset.invoice, 'name': 'Invoice'},
  ];
}