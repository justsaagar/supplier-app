import 'dart:io';

import 'package:get/get.dart';
import 'package:supplier/model/payment_request_model.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/utils.dart';

import '../constant/string_constant.dart';

class PaymentController extends GetxController {
  int currentIndex = 0;
  List<PaymentRequestContent> paymentRequestContent = <PaymentRequestContent>[];
  int currentPage = 0;
  bool isLoading = false;

  Future<void> onTabChanged(index) async {
    currentIndex = index;
    if (index == 0) {
      await getPaymentRequest();
    }
    update();
  }

  Future<void> getPaymentRequest({bool isRefresh = true}) async {
    isLoading = true;
    update();
    if (isRefresh) {
      paymentRequestContent.clear();
      currentPage = 0;
    } else {
      currentPage++;
    }
    try {
      final response = await RestServices.instance.getRestCall(
        endpoint: RestConstants.instance.billedOrders,
        addOns: '/${AppStringConstants.storeLogInId}?size=10&page=$currentPage',
      );
      if (response != null && response.isNotEmpty) {
        PaymentRequestModel paymentRequestModel = paymentRequestModelFromJson(response);
        paymentRequestContent.addAll(paymentRequestModel.paymentRequestContent);
      }
    } on SocketException catch (e) {
      logs('Catch socketException in getPaymentRequest --> ${e.message}');
    }
    isLoading = false;
    update();
  }
}
