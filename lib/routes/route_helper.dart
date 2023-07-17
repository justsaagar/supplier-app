import 'package:get/get.dart';
import 'package:supplier/routes/route_constant.dart';
import 'package:supplier/screen/login_screen/login_screen.dart';
import 'package:supplier/screen/otp_verification_screen/mobile_verification_screen.dart';
import 'package:supplier/screen/otp_verification_screen/otp_verification_screen.dart';
import 'package:supplier/screen/splash_screen/splash_screen.dart';

class RouteHelper {
  static String getInitialRoute() => RouteConstant.initial;
  static String getNoInternetRoute() => RouteConstant.initial;
  static String getLoginRoute() => RouteConstant.login;
  static String getMobileVerificationRoute() => RouteConstant.mobileVerification;
  static String getOtpVerificationRoute() => RouteConstant.otpVerification;

  static List<GetPage> routes = [
    GetPage(name: RouteConstant.initial, page: () => const SplashScreen()),
    /// TODO : Change with no internet screen
    GetPage(name: RouteConstant.noInternet, page: () => const SplashScreen()),
    GetPage(name: RouteConstant.login, page: () => const LogInScreen()),
    GetPage(name: RouteConstant.mobileVerification, page: () => const MobileVerificationScreen()),
    GetPage(name: RouteConstant.otpVerification, page: () => const OtpVerificationScreen()),
  ];
}
