import 'package:flutter/material.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';

class AppTabBar extends StatelessWidget {
  final List<String> tabs;
  final int currentIndex;
  final Function(int) onTabChanged;

  const AppTabBar({
    super.key,
    required this.tabs,
    required this.currentIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorConstant.appWhite,
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 12, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          tabs.length,
          (index) => GestureDetector(
            onTap: () => onTabChanged(index),
            child: tabItem(tabs[index], index),
          ),
        ),
      ),
    );
  }

  Widget tabItem(String tabTitle, int index) {
    bool isSelected = index == currentIndex;
    return Column(
      children: [
        const SizedBox(height: 3),
        AppText(
          tabTitle,
          color: AppColorConstant.appBlack,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          fontSize: 13,
        ),
        const SizedBox(height: 8),
        isSelected
            ? Container(
                height: 4,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                  color: AppColorConstant.appOrange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: AppText(tabTitle, color: AppColorConstant.appOrange),
              )
            : Container(
                height: 4,
                padding: const EdgeInsets.symmetric(horizontal: 7),
              )
      ],
    );
  }
}
