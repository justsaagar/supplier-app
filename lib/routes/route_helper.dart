import 'package:get/get.dart';
import 'package:supplier/routes/route_constant.dart';
import 'package:supplier/screen/splash_screen/splash_screen.dart';

class RouteHelper {
  static String getInitialRoute() => RouteConstant.initial;
  static String getNoInternetRoute() => RouteConstant.initial;

  static List<GetPage> routes = [
    GetPage(name: RouteConstant.initial, page: () => const SplashScreen()),
    /// TODO : Change with no internet screen
    GetPage(name: RouteConstant.noInternet, page: () => const SplashScreen()),
  ];
}
