import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:supplier/routes/route_helper.dart';

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
}
