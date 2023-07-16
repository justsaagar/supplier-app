import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_forceupdate_dialog.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_no_internet_alert.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/plumster_asset.dart';
import 'package:supplier/routes/route_helper.dart';
import 'package:supplier/service/connectivity_service.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/shared_preference.dart';
import 'package:supplier/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    manageLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: Device.height,
            width: Device.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColorConstant.lightBlue, AppColorConstant.darkBlue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          AppImageAsset(image: AppAsset.splashLogoImage, height: 130.px, width: Device.width * 0.76),
        ],
      ),
    );
  }

  Future<bool> forceUpdate() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int? appVersion = int.parse(packageInfo.version.replaceAll('.', ''));
    logs('App version --> $appVersion');
    logs('Remote version --> ${RestConstants.instance.supplierAppVersion}');
    if (appVersion < RestConstants.instance.supplierAppVersion) {
      appForceUpdateDialog();
      return true;
    }
    return false;
  }

  Future<void> manageLogin() async {
    if (await forceUpdate()) return;
    ConnectivityService.instance.connectionStream();
    bool isAuthenticated = await getPrefBoolValue(authenticateUser);
    if (!await ConnectivityService.instance.isConnectNetworkWithMessage()) {
      Get.dialog(const AppNoInternetAlert(), barrierDismissible: false);
      return;
    }
    logs('IsAuthenticated --> $isAuthenticated');
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.toNamed(isAuthenticated ? RouteHelper.getLoginRoute() : RouteHelper.getLoginRoute()),
    );
  }
}
