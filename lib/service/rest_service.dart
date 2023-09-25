import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:supplier/service/connectivity_service.dart';
import 'package:supplier/utils/string_extensions.dart';
import 'package:supplier/utils/utils.dart';

class RestConstants {
  RestConstants._privateConstructor();

  static final RestConstants instance = RestConstants._privateConstructor();


  //     ======================= API BaseUrl =======================     //
  String supplierBaseUrl = '';
  final int supplierAppVersion = 0;

  //     ======================= API EndPoints =======================     //
  final String logInWithPhone = 'api-auth/verify/phone';
  final String sendOtp = 'api-auth/send/otp';
  final String storeLoginOtp = 'api-auth/store/login/otp';
  final String storeProfile = 'api-auth/store/profile';
  final String storeCategory = 'api-product/categorys';
  final String editProfile = 'api-auth/store/profile';
  final String allOrders = 'api-oms/order/store';
  final String uploadImage = 'api-auth/image';
  final String registerRider = 'api-auth/rider/register';
  final String getAllRiders = 'api-auth/emp/store/getAllRiders/';
  final String searchProduct = 'api-product/product/text/search/';
  final String productDetails = 'api-product/product/';
  final String acceptedOrders = 'api-oms/order/store';
  final String billedOrders = 'api-oms/billedOrders';
  final String paymentRequest = 'api-oms/b2b/paymentRequest';
  final String paymentHistoryByOrder = 'api-oms/b2b/paymentDetails';
}
class RestServices {
  RestServices._privateConstructor();

  static final RestServices instance = RestServices._privateConstructor();

  Map<String, String> headers = {'Content-Type': 'application/json'};

  void showRequestAndResponseLogs(http.Response? response, Map<String, Object> requestData) {
    logs('•••••••••• Network logs ••••••••••');
    logs('Request code --> ${response!.statusCode} : ${response.request!.url}');
    logs('Request headers --> $requestData');
    logs('Response headers --> ${response.headers}');
    logs('Response body --> ${response.body}');
    logs('••••••••••••••••••••••••••••••••••');
  }

  Future<String?>? getRestCall({required String? endpoint, String? addOns, bool addGuestToken = false}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.instance.supplierBaseUrl}/$endpoint$addOns'
          : '${RestConstants.instance.supplierBaseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);

      Map<String, String> guestTokenHeader = {'Authorization': 'anonymous'};

      Response response = await http.get(requestedUri!, headers: addGuestToken ? guestTokenHeader : headers);

      showRequestAndResponseLogs(response, addGuestToken ? guestTokenHeader : headers);

      switch (response.statusCode) {
        case 200:
        case 201:
        case 400:
        case 422:
          responseData = response.body;
          break;
        case 404:
        case 500:
        case 502:
          logs('${response.statusCode}');
          break;
        case 405:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if (responseMap.containsKey('error')) {
            '${response.statusCode} : ${responseMap['error']}'.showError();
          }
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in getRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<String?>? postRestCall(
      {required String? endpoint,
      required Map<String, dynamic>? body,
      String? addOns,
      String? stringBody,
      bool addGuestToken = false,
      bool show400Toast = true}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }

    try {
      String requestUrl = addOns != null
          ? '${RestConstants.instance.supplierBaseUrl}/$endpoint$addOns'
          : '${RestConstants.instance.supplierBaseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      logs('Body map --> ${jsonEncode(body)}');
      headers['Content-Type'] = 'application/json';
      if (stringBody != null) {
        logs('String Body --> $stringBody');
        headers['Content-Type'] = 'text/plain';
      }

      Map<String, String> guestTokenHeader = {'Authorization': 'anonymous'};

      Response response = await http.post(
        requestedUri!,
        body: stringBody ?? jsonEncode(body),
        headers: addGuestToken ? guestTokenHeader : headers,
      );
      showRequestAndResponseLogs(response, headers);
      switch (response.statusCode) {
        case 200:
        case 500:
        case 201:
        case 401:
          responseData = response.body;
          break;
        case 400:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if (responseMap.isNotEmpty && responseMap.containsKey('message')) {
            if (show400Toast) responseMap['message'].toString().showError();
          }
          if (!show400Toast) responseData = response.body;
          break;
        case 502:
        case 404:
          logs('${response.statusCode}');
          break;
        case 403:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if (responseMap.isNotEmpty && responseMap.containsKey('message')) {
            if (show400Toast) responseMap['message'].toString().showError();
          }
          if (!show400Toast) responseData = response.body;
          logs('${response.statusCode}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in postRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<String?>? multiPartRestCall(
      {required String? endpoint,
      required Map<String, String>? body,
      required String? keyName,
      required String? fileName}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = '${RestConstants.instance.supplierBaseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      MultipartRequest request = http.MultipartRequest('POST', requestedUri!);
      headers['Content-Type'] = 'multipart/form-data';
      // request.headers.addAll({'Content-Type':'multipart/form-data'});
      request.headers.addAll(headers);
      if (body!.isNotEmpty) {
        request.fields.addAll(body);
      }
      request.files.add(await http.MultipartFile.fromPath(
        keyName!,
        fileName!,
        // contentType: MediaType.parse('image/jpeg'),
      ));
      StreamedResponse responseStream = await request.send();
      final response = await http.Response.fromStream(responseStream);
      logs("response $response");

      showRequestAndResponseLogs(response, request.headers);
      logs("request.headers ${request.headers}");

      switch (response.statusCode) {
        case 200:
        case 201:
          responseData = response.body;
          break;
        case 500:
        case 502:
        case 400:
        case 404:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in multiPartRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<String?>? deleteRestCall({required String? endpoint, Map<String, dynamic>? body, String? addOns}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.instance.supplierBaseUrl}/$endpoint$addOns'
          : '${RestConstants.instance.supplierBaseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);

      headers.remove('Content-Type');
      Response response = await http.delete(requestedUri!, headers: headers, body: body);

      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 422:
        case 201:
          responseData = response.body;
          break;
        case 500:
        case 502:
        case 400:
        case 404:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in deleteRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<String?>? putRestCall(
      {required String? endpoint, required Map<String, dynamic>? body, String? addOns, File? selectedFile}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = selectedFile != null
          ? addOns!
          : addOns != null
              ? '${RestConstants.instance.supplierBaseUrl}/$endpoint/$addOns'
              : '${RestConstants.instance.supplierBaseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);

      Map<String, String> header = {
        'Content-Type': selectedFile != null ? 'image/${selectedFile.path.split('.').last}' : ''
      };

      Response response = await http.put(
        requestedUri!,
        headers: selectedFile != null ? header : headers,
        body: selectedFile != null ? selectedFile.readAsBytesSync() : jsonEncode(body),
      );

      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 201:
          responseData = selectedFile == null ? response.body : response.statusCode.toString();
          break;
        case 500:
        case 502:
        case 400:
        case 404:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in putRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<String?>? patchRestCall(
      {required String? endpoint,
      required Map<String, dynamic>? body,
      String? addOns,
      bool show400Toast = true}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.instance.supplierBaseUrl}/$endpoint/$addOns'
          : '${RestConstants.instance.supplierBaseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);

      logs('Body map --> $body');

      Response response = await http.patch(requestedUri!, headers: headers, body: jsonEncode(body));

      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 500:
        case 201:
        case 401:
          responseData = response.body;
          break;
        case 400:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if (responseMap.isNotEmpty && responseMap.containsKey('message')) {
            if (show400Toast) responseMap['message'].toString().showError();
          }
          if (!show400Toast) responseData = response.body;
          break;
        case 502:
        case 404:
          logs('${response.statusCode}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in patchRestCall --> ${e.message}');
    }
    return responseData;
  }
}
