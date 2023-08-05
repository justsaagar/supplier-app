import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/app_text_form_field.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/inventory_controller.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Inventory'),
      body: GetBuilder(
          init: InventoryController(),
          builder: (InventoryController inventoryController) {
            return Column(
              children: [
                searchBarView(inventoryController),
                inventoryItemView(),
              ],
            );
          }),
    );
  }

  searchBarView(InventoryController inventoryController) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppTextFormField(
        controller: inventoryController.searchController,
        hintText: 'Search Product',
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

  inventoryItemView() {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.only(bottom: 15),
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Expanded(
                    child: AppText(
                      'Tata Chana dal',
                      color: AppColorConstant.appBlack,
                      fontWeight: FontWeight.w500,
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    children: [
                      AppText('Sale Price  ', color: AppColorConstant.appBlack),
                      AppText(
                        '₹70',
                        color: AppColorConstant.appBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ],
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AppText(
                        '1 kg',
                        color: AppColorConstant.appBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      AppText(
                        'MRP : ',
                        color: AppColorConstant.appBlack,
                        fontSize: 12,
                      ),
                      AppText(
                        '₹75',
                        color: AppColorConstant.appGrey,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 3),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AppText(
                        'In Stock: ',
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
                  Row(
                    children: [
                      AppText(
                        'PTR : ',
                        color: AppColorConstant.appBlack,
                        fontSize: 12,
                      ),
                      AppText(
                        '₹75',
                        color: AppColorConstant.appGreen,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ],
                  ),
                ],
              ),
              const AppText(
                'LocUniGro000009_Orgveg',
                fontSize: 11,
                color: AppColorConstant.appGrey,
              ),
              Container(
                height: 1,
                margin: const EdgeInsets.only(top: 10),
                color: AppColorConstant.appGrey.withOpacity(0.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
