import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MastersController extends GetxController {
  int currentIndex = 0;
  bool isToggled = false;
  int selectedIndex = 0;
  TextEditingController searchController = TextEditingController();

  void onTabChanged(index) {
    currentIndex = index;
    update();
  }

  void onToggle(value) {
    isToggled = !isToggled;
    update();
  }
}
