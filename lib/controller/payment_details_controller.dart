import 'package:get/get.dart';

class PaymentDetailsController extends GetxController {
  Map<String, dynamic> paramMap = {};

  @override
  void onInit() {
    paramMap = Get.parameters;
    super.onInit();
  }
}
