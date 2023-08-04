import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';

class AnalyticsController extends GetxController {
  bool isSelect = false;
  int selectedIndex = 0;
  List<Color> firstColorList = [];
  List<Color> secondColorList = [];

  @override
  void onInit() {
    for (var element in firstChartList) {
      firstColorList.add(element['color']);
    }
    for (var element in secondChartList) {
      secondColorList.add(element['color']);
    }
    update();
    super.onInit();
  }

  List<Map<String, dynamic>> analysisItemList = [
    {'title': 'Total Products', 'rupees': '405', 'image': AppAsset.productIcon},
    {'title': 'Total Revenue', 'rupees': '₹ 1,35,210', 'image': AppAsset.rupeesIcon},
    {'title': 'Total Customers', 'rupees': '368', 'image': AppAsset.customerIcon},
    {'title': 'Active Orders', 'rupees': '03', 'image': AppAsset.activeOrderIcon},
    {'title': 'Total Orders', 'rupees': '426', 'image': AppAsset.orderIcon},
  ];

  List<Map<String, dynamic>> firstChartList = [
    {
      'color': AppColorConstant.appChartRed,
      'title': ' Express',
      'subTitle': ' 1540',
    },
    {
      'color': AppColorConstant.appChartYellow,
      'title': 'Instant',
      'subTitle': ' 1540',
    },
    {
      'color': AppColorConstant.appChartBlue,
      'title': 'Scheduled',
      'subTitle': ' 1540',
    },
  ];

  List<Map<String, dynamic>> secondChartList = [
    {
      'color': AppColorConstant.appChartRed,
      'title': ' Foodgrains, oil & Masala',
      'subTitle': '54%',
    },
    {
      'color': AppColorConstant.appChartYellow,
      'title': 'Bakery, Cakes, Dairy & Beverages',
      'subTitle': '13.6%',
    },
    {
      'color': AppColorConstant.appChartPurple,
      'title': 'Snacks & Branded food',
      'subTitle': '1540',
    },
    {
      'color': AppColorConstant.appChartDarkBlue,
      'title': 'Beauty & Hygiene',
      'subTitle': '54%',
    },
    {
      'color': AppColorConstant.appChartLightBlue,
      'title': 'Cleaning & Household',
      'subTitle': '13.6%',
    },
    {
      'color': AppColorConstant.appChartPink,
      'title': 'Kitchen needs',
      'subTitle': '10%',
    },
    {
      'color': AppColorConstant.appChartGreen,
      'title': 'Eggs, Fish & Meat',
      'subTitle': '13.6%',
    },
    {
      'color': AppColorConstant.appChartBlue,
      'title': 'Gourmet & World food',
      'subTitle': '4.5%',
    },
  ];

  void selectCard(int index) {
    isSelect = !isSelect;
    selectedIndex = index;
    update();
  }
}
