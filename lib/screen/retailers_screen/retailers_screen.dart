import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/app_text_form_field.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/retailers_controller.dart';
import 'package:supplier/routes/route_helper.dart';

class RetailersScreen extends StatelessWidget {
  const RetailersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Retailers'),
      body: GetBuilder(
          init: RetailersController(),
          builder: (RetailersController retailersController) {
            return Column(
              children: [
                searchBarView(retailersController),
                retailersDataView(),
              ],
            );
          }),
    );
  }

  searchBarView(RetailersController retailersController) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: AppTextFormField(
        controller: retailersController.searchController,
        hintText: 'Search',
        headerTitle: '',
        filedColor: AppColorConstant.appWhite,
        isBorder: true,
        prefixIcon: const AppImageAsset(
          image: AppAsset.searchIcon,
          color: AppColorConstant.appGrey,
        ),
      ),
    );
  }

  retailersDataView() {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.only(top: 10, bottom: 15),
        itemBuilder: (context, index) => GestureDetector(
          onTap: ()=>Get.toNamed(RouteHelper.getRetailerDetailsRoute()),
          child: Container(
            decoration: AppColorConstant.boxDecoration,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AppText(
                        'Srinivas Store',
                        color: AppColorConstant.appBlack,
                        fontWeight: FontWeight.w500,
                        maxLines: 2,
                      ),
                    ),
                    Row(
                      children: [
                        AppText('Status: ', color: AppColorConstant.appGrey),
                        AppText(
                          'Active',
                          color: AppColorConstant.appGreen,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    AppText(
                      'Order count: ',
                      color: AppColorConstant.appBlack,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      '50',
                      color: AppColorConstant.appBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
