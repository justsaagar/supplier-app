import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/screen/dashboard_module/home_screen/home_screen.dart';
import 'package:supplier/screen/dashboard_module/notification_screen/notification_screen.dart';

class DashboardController extends GetxController {
  int selectedBottomIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> bottomBarItems = [
    {'name' : 'Home', 'icon': AppAsset.homeIcon, 'pageName': const HomeScreen()},
    {'name' : 'Masters', 'icon': AppAsset.mastersIcon, 'pageName': Container()},
    {'name' : 'Payments', 'icon': AppAsset.paymentsIcon, 'pageName': Container()},
    {'name' : 'Notifications', 'icon': AppAsset.notificationsIcon, 'pageName': const NotificationScreen()},
    {'name' : 'Account', 'icon': AppAsset.accountIcon, 'pageName': Container()},
  ];

  void updatePageIndex(int index) {
    selectedBottomIndex = index;
    update();
  }
}