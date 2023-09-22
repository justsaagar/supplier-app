import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/controller/edit_profile_controller.dart';
import 'package:supplier/model/product_search_model.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/string_extensions.dart';

class SubscriptionController extends GetxController {
  List<ProductSearchModel> productSearchModelList = [];
  ProductSearchModel? productSearchModel;
  ProductResult? productResult;
  final TextEditingController searchProductController = TextEditingController();

  Future<List<String>> searchOnChanged(String query) async {
    List<String> productSearchList = [];
    final String? response = await RestServices.instance.getRestCall(endpoint: '${RestConstants.instance.searchProduct}/$query/category/${AppStringConstants.storeCategoryId}?page=0&size=10');
    if (response != null && response.isNotEmpty) {
      productSearchModelList = productSearchModelFromJson(response);
      for (ProductSearchModel element in productSearchModelList) {
        productSearchList.add(element.productName ?? '');
      }
    }
    return productSearchList;
  }

  @override
  void onInit() {
    Get.put(EditProfileController()).getStoreProfile();
    super.onInit();
  }

  Future<void> subscribeProduct() async {
    final String? response = await RestServices.instance.putRestCall(
      endpoint: RestConstants.instance.productDetails,
      addOns: '${productSearchModel!.id}/subscribe/${AppStringConstants.storeLogInId}',
      body: {}
    );
    if (response != null && response.isNotEmpty) {
      Map<String, dynamic> responseMap = jsonDecode(response);
      if (responseMap['status']) Get.back();
      responseMap['status']
          ? responseMap['message'].toString().showSuccess()
          : responseMap['message'].toString().showError();
    }
  }
}
