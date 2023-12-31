import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/app_text_form_field.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/inventory_controller.dart';
import 'package:supplier/model/inventory_stock_model.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Inventory'),
      body: GetBuilder(
        init: InventoryController(),
        autoRemove: false,
        global: true,
        initState: (state) {
          Future.delayed(
            const Duration(microseconds: 300),
            () {
              final inventoryController = Get.find<InventoryController>();
              inventoryController.getStoreInventory(isRefresh: true);
            },
          );
        },
        builder: (InventoryController inventoryController) {
          return Column(
            children: [
              searchBarView(inventoryController),
              Expanded(
                child: ListView.builder(
                  itemCount: inventoryController.allInventoryList.length,
                  padding: const EdgeInsets.only(bottom: 15),
                  itemBuilder: (context, index) {
                    InventoryStockModel inventoryStockModel = inventoryController.allInventoryList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: [
                              Expanded(
                                child: AppText(
                                  inventoryStockModel.productName ?? '',
                                  fontWeight: FontWeight.w500,
                                  maxLines: 2,
                                ),
                              ),
                              Row(
                                children: [
                                  const AppText('Sale Price  '),
                                  AppText(
                                    '₹${inventoryStockModel.price ?? 0}',
                                    color: AppColorConstant.appBlack,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  AppText(
                                    '${inventoryStockModel.skuCode ?? ''} kg',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const AppText('MRP : ', fontSize: 12),
                                  AppText(
                                    '₹${inventoryStockModel.mrp ?? ''}',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const AppText(
                                    'In Stock: ',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  AppText(
                                    '${inventoryStockModel.stockStatus ?? ''}',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const AppText(
                                    'PTR : ',
                                    fontSize: 12,
                                  ),
                                  AppText(
                                    '₹${inventoryStockModel.ptr ?? ''}',
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
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
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
}
