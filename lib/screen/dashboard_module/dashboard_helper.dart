import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/dashboard_controller.dart';

class BottomBarItems extends StatelessWidget {
  final DashboardController indexPageController;
  final int index;

  const BottomBarItems({Key? key, required this.index, required this.indexPageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = indexPageController.selectedBottomIndex == index;
    return GestureDetector(
      onTap: () => indexPageController.updatePageIndex(index),
      child: Container(
        height: 60.px,
        width: Device.width / indexPageController.bottomBarItems.length,
        decoration: BoxDecoration(
          color: AppColorConstant.appWhite,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -6),
              spreadRadius: 0.2,
              color: AppColorConstant.lightGreyColor.withOpacity(0.2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          children: [
            isSelected
                ? Container(
                    height: 5.px,
                    margin: EdgeInsets.symmetric(horizontal: 20.px),
                    width: Device.width / indexPageController.bottomBarItems.length,
                    decoration: BoxDecoration(
                      color: AppColorConstant.appDarkBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.px),
                        bottomRight: Radius.circular(8.px),
                      ),
                    ),
                  )
                : SizedBox(height: 5.px),
            SizedBox(height: 10.px),
            Column(
              children: [
                AppImageAsset(
                  image: indexPageController.bottomBarItems[index]['icon'],
                  color: isSelected ? AppColorConstant.appDarkBlue : AppColorConstant.appBottomBarGrey,
                  height: isSelected ? 22.px : 20.px,
                ),
                SizedBox(height: 6.px),
                AppText(
                  indexPageController.bottomBarItems[index]['name'] ?? '',
                  color: isSelected ? AppColorConstant.appDarkBlue : AppColorConstant.appBottomBarGrey,
                  fontSize: 11.px,
                  maxLines: 1,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
