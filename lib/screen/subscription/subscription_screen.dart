import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/subscription_controller.dart';
import 'package:supplier/model/product_search_model.dart';
import 'package:supplier/service/rest_service.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Subscription'),
      body: GetBuilder(
        init: SubscriptionController(),
        builder: (SubscriptionController subscriptionController) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                decoration: const BoxDecoration(color: AppColorConstant.appLightWhite),
                alignment: Alignment.center,
                child: TypeAheadField<String>(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: subscriptionController.searchProductController,
                    autofocus: true,
                    cursorColor: AppColorConstant.primaryColor,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColorConstant.appBluest,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                      suffixIconConstraints: BoxConstraints(maxHeight: 2),
                      hintText: 'Select product',
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: AppColorConstant.appGrey,
                        fontWeight: FontWeight.w500,
                      ),
                      contentPadding: EdgeInsets.only(left: 5, bottom: 0.8, top: 0.8),
                      isDense: true,
                      filled: true,
                      fillColor: AppColorConstant.appLightWhite,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    return subscriptionController.searchOnChanged(pattern);
                  },
                  itemBuilder: (context, suggestion) => Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(bottom: BorderSide(color: AppColorConstant.textBlackColor)),
                    ),
                    child: AppText((suggestion ?? '').toString(), color: AppColorConstant.appBluest),
                  ),
                  onSuggestionSelected: (suggestion) async {
                    subscriptionController.searchProductController.text = suggestion;
                    subscriptionController.productSearchModel = subscriptionController.productSearchModelList.firstWhere((element) {
                      return (element.productName ?? '').toLowerCase() == suggestion.toLowerCase();
                    });
                    log('ProductSearchModel --> ${subscriptionController.productSearchModel!.toJson()}');
                    final String? productSearch = await RestServices.instance.getRestCall(
                      endpoint: RestConstants.instance.productDetails,
                      addOns: '/${subscriptionController.productSearchModel!.id}',
                    );
                    if (productSearch != null && productSearch.isNotEmpty) {
                      subscriptionController.productResult = productResultFromJson(productSearch);
                    }
                    subscriptionController.update();
                  },
                  noItemsFoundBuilder: (context) => const SizedBox(),
                  loadingBuilder: (context) => const SizedBox(),
                ),
              ),
              if (subscriptionController.productResult != null)
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
                    children: [
                      Container(
                        decoration: const BoxDecoration(color: Color(0xffF5F5F5)),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: AppText(
                                'Product details',
                                fontSize: 18,
                                color: AppColorConstant.appBluest,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  bottom: BorderSide(color: AppColorConstant.dividerColor, width: 1),
                                  right: BorderSide(color: AppColorConstant.dividerColor, width: 1),
                                  left: BorderSide(color: AppColorConstant.dividerColor, width: 1),
                                ),
                              ),
                              child: Column(
                                children: [
                                  reviewDetails(
                                    width: Device.width,
                                    title: 'Product Name',
                                    subTitle: subscriptionController.productResult!.name ?? '--',
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 6),
                                    child: Divider(
                                      color: AppColorConstant.dividerColor,
                                      thickness: 1,
                                      height: 1,
                                    ),
                                  ),
                                  reviewDetails(
                                    width: Device.width,
                                    title: 'Manufacturer',
                                    subTitle: subscriptionController.productResult!.manufacturer ?? '--',
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 6),
                                    child: Divider(
                                      color: AppColorConstant.dividerColor,
                                      thickness: 1,
                                      height: 1,
                                    ),
                                  ),
                                  reviewDetails(
                                    width: Device.width,
                                    title: 'Description',
                                    subTitle: subscriptionController.productResult!.description ?? '--',
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 6),
                                    child: Divider(
                                      color: AppColorConstant.dividerColor,
                                      thickness: 1,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: () => subscriptionController.subscribeProduct(),
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColorConstant.primaryColor,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const AppText(
                            'Subscribe',
                            textAlign: TextAlign.center,
                            color: AppColorConstant.appWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Row buildProductDetails(BuildContext context, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          child: AppHeaderText(
            headerText: '$title : ',
            headerColor: AppColorConstant.borderColor,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: AppText(value, color: AppColorConstant.textBlackColor)),
      ],
    );
  }

  reviewDetails({double? width, String? title, String? subTitle, Color? titleColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width! / 3.2,
            child: AppText(
              title ?? '',
              fontSize: width * 0.032,
              color: titleColor ?? AppColorConstant.appBluest,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: width * 0.06,
            child: AppText(
              ':',
              fontSize: width * 0.032,
              color: AppColorConstant.appBluest,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(
            child: Html(data: subTitle),
            // child: CommonText(
            //   content: subTitle,
            //   textSize: width * 0.032,
            //   textColor: AppColorConstant.appBluest,
            //   boldNess: FontWeight.w400,
            // ),
          ),
        ],
      ),
    );
  }
}
