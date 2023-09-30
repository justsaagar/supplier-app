import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/screen/dashboard_module/home/home_screen/home_screen.dart';
import 'package:supplier/screen/dashboard_module/masters_screen/masters_screen.dart';
import 'package:supplier/screen/dashboard_module/notification_screen/notification_screen.dart';
import 'package:supplier/screen/dashboard_module/profile_screen/profile_screen.dart';
import 'package:supplier/screen/payment_screen/payment_screen.dart';
import 'package:supplier/utils/shared_preference.dart';
import 'package:supplier/utils/utils.dart';

class DashboardController extends GetxController {
  int selectedBottomIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, dynamic>> bottomBarItems = [
    {'percentage':'45%','title' : 'home', 'icon': AppAsset.homeIcon, 'pageName': const HomeScreen()},
    {'percentage':'45%','title' : 'Masters', 'icon': AppAsset.mastersIcon, 'pageName': const MastersScreen()},
    {'percentage':'45%','title' : 'Payments', 'icon': AppAsset.paymentsIcon, 'pageName': const PaymentScreen()},
    {'percentage':'45%','title' : 'Notifications', 'icon': AppAsset.notificationsIcon, 'pageName': const NotificationScreen()},
    {'percentage':'45%','title' : 'Account', 'icon': AppAsset.accountIcon, 'pageName': const ProfileScreen()},
  ];

  void updatePageIndex(int index) {
    selectedBottomIndex = index;
    update();
  }

  Future<void> initializeValue() async {
    AppStringConstants.storeName = await getPrefStringValue(storeName) ?? '';
    AppStringConstants.storeLogInId = await getPrefStringValue(storeLogInId) ?? '';
    AppStringConstants.storeCategoryId = await getPrefStringValue(storeCategoryId) ?? '';
    logs('Store name --> ${AppStringConstants.storeName}');
    logs('Store storeLogInId --> ${AppStringConstants.storeLogInId}');
    logs('Store storeCategoryId --> ${AppStringConstants.storeCategoryId}');
  }
}