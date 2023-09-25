import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:supplier/app/widget/app_success_animation.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/model/payment_request_model.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/string_extensions.dart';
import 'package:supplier/utils/utils.dart';

enum PaymentType { billedOrders, fullyPaid }

class PaymentController extends GetxController {
  int currentIndex = 0;
  List<PaymentRequestContent> paymentRequestContent = <PaymentRequestContent>[];
  int currentPage = 0;
  bool isLoading = false;

  Future<void> onTabChanged(index) async {
    currentIndex = index;
    await getPaymentRequest(
      index == 0 ? PaymentType.billedOrders : PaymentType.fullyPaid,
    );
    update();
  }

  Future<void> getPaymentRequest(PaymentType paymentType,
      {bool isRefresh = true}) async {
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
        addOns: paymentType == PaymentType.fullyPaid
            ? '/${paymentType.name}/${AppStringConstants.storeLogInId}?size=10&page=$currentPage'
            : '/${AppStringConstants.storeLogInId}?size=10&page=$currentPage',
      );
      if (response != null && response.isNotEmpty) {
        PaymentRequestModel paymentRequestModel =
            paymentRequestModelFromJson(response);
        paymentRequestContent.addAll(paymentRequestModel.paymentRequestContent);
      }
    } on SocketException catch (e) {
      logs('Catch socketException in getPaymentRequest --> ${e.message}');
    }
    isLoading = false;
    update();
  }

  Future<void> requestPayment({
    required String paymentId,
    required String orderId,
    required num orderAmount,
    required num paidAmount,
    required num billedAmount,
    required String storeId,
    required String payerId,
  }) async {
    try {
      final Map<String, dynamic> bodyMap = {
        'paymentId': paymentId,
        'paidDate': DateTime.now().toIso8601String(),
        'orderId': orderId,
        'orderAmount': orderAmount,
        'paidAmount': paidAmount,
        'billedAmount': billedAmount,
        'storeId': storeId,
        'trasactionStatus': 'Request',
        'payerId': payerId,
        'paymentMode': 'Online',
        'paymentType': 'CR'
      };
      final response = await RestServices.instance.postRestCall(
        endpoint: RestConstants.instance.paymentRequest,
        body: bodyMap,
      );
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> requestMap = jsonDecode(response);
        if (requestMap.isNotEmpty && requestMap.containsKey('status') && requestMap['status']) {
          if (requestMap['message'].toString().toLowerCase().contains('saved')) {
            Get.dialog(const AppSuccessAlert());
            Future.delayed(const Duration(seconds: 2), () => Get.back());
          } else {
            requestMap['message'].toString().showError();
          }
        }
      }
    } on SocketException catch (e) {
      logs('Catch socketException in requestPayment --> ${e.message}');
    }
    isLoading = false;
    update();
  }
}
