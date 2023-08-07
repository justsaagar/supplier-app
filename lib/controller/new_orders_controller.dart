import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewOrdersController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  Map<String, dynamic> manageOrderMap = {};

  void onTabChanged(index){
    currentIndex = index;
    update();
  }
}