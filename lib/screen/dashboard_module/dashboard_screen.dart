import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_drawer.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/dashboard_controller.dart';
import 'package:supplier/screen/dashboard_module/dashboard_helper.dart';
import 'package:supplier/utils/utils.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (DashboardController dashboardController) {
        return Scaffold(
          key: dashboardController.scaffoldKey,
          backgroundColor: AppColorConstant.appLightWhite,
          appBar: AppAppBar(appBarHeight: 60.px),
          drawer: const AppDrawer(),
          body: dashboardController.bottomBarItems[dashboardController.selectedBottomIndex]['pageName'],
          bottomNavigationBar: SafeArea(
            child: Row(
              children: List.generate(
                dashboardController.bottomBarItems.length,
                (index) => BottomBarItems(index: index, indexPageController: dashboardController),
              ),
            ),
          ),
        );
      },
    );
  }
}
