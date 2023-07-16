import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:supplier/app/widget/app_no_internet_alert.dart';
import 'package:supplier/routes/route_helper.dart';
import 'package:supplier/utils/shared_preference.dart';
import 'package:supplier/utils/utils.dart';

class ConnectivityService {
  ConnectivityService._privateConstructor();

  static final ConnectivityService instance = ConnectivityService._privateConstructor();

  InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();
  bool isConnected = true;

  Future<bool> checkConnection() async => await internetConnectionChecker.hasConnection;

  Future<bool> isConnectNetworkWithMessage() async {
    isConnected = await internetConnectionChecker.hasConnection;
    if (!isConnected) Get.toNamed(RouteHelper.getNoInternetRoute());
    return isConnected;
  }

  void connectionStream() async {
    bool isAuthenticated = await getPrefBoolValue(authenticateUser);
    internetConnectionChecker.onStatusChange.listen(
      (InternetConnectionStatus event) {
        switch (event) {
          case InternetConnectionStatus.connected:
            Get.back();
            Get.toNamed(isAuthenticated ? RouteHelper.getLoginRoute() : RouteHelper.getLoginRoute());
            logs('Data connection is available.');
            break;
          case InternetConnectionStatus.disconnected:
            Get.dialog(const AppNoInternetAlert(), barrierDismissible: false);
            logs('Data connection is not available.');
            break;
        }
      },
    );
  }
}
