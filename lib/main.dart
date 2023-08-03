import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/routes/route_helper.dart';
import 'package:supplier/utils/utils.dart';

import 'service/remote_config_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColorConstant.appWhite,
      statusBarColor: AppColorConstant.appBluest,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    getBaseUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation, screenType) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: GetMaterialApp(
            title: 'Supplier app',
            navigatorKey: Get.key,
            theme: ThemeData(useMaterial3: true, fontFamily: AppAsset.defaultFont),
            debugShowCheckedModeBanner: false,
            initialRoute: kDebugMode ? RouteHelper.getDashboardRoute() : RouteHelper.getInitialRoute(),
            getPages: RouteHelper.routes,
            defaultTransition: Transition.fadeIn,
            scrollBehavior: MyBehavior(),
            builder: (context, child) {
              child =
                  MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child ?? Container());
              return child;
            },
          ),
        );
      },
    );
  }

  Future<void> getBaseUrl() async {
    final remoteController = Get.put(RemoteConfigProvider());
    await remoteController.getCurrentUser();
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) => child;
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
