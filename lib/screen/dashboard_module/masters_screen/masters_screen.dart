import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_tab_bar.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/app_text_form_field.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/masters_controller.dart';
import 'package:supplier/routes/route_helper.dart';

class MastersScreen extends StatelessWidget {
  const MastersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MastersController(),
      builder: (MastersController mastersController) {
        return Column(
          children: [
            AppTabBar(
              tabs: const ["Products", "Today's Deal"],
              onTabChanged: (index) => mastersController.onTabChanged(index),
              currentIndex: mastersController.currentIndex,
            ),
            searchBarView(mastersController),
            Expanded(
              child: buildCurrentScreen(
                mastersController.currentIndex,
                mastersController,
              ),
            ),
          ],
        );
      },
    );
  }

  searchBarView(MastersController mastersController) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: AppTextFormField(
        controller: mastersController.searchController,
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

  Widget buildCurrentScreen(currentIndex, MastersController mastersController) {
    switch (currentIndex) {
      case 0:
        return ProductsScreen(mastersController: mastersController);
      case 1:
        return TodaysDealScreen(mastersController: mastersController);
      default:
        return ProductsScreen(mastersController: mastersController);
    }
  }
}

class ProductsScreen extends StatelessWidget {
  final MastersController mastersController;

  const ProductsScreen({Key? key, required this.mastersController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: [
                const Expanded(
                  child: AppText(
                    'Tata Chana dal',
                    color: AppColorConstant.appBlack,
                    fontWeight: FontWeight.w500,
                    maxLines: 2,
                  ),
                ),
                FlutterSwitch(
                  width: 50.px,
                  height: 26.px,
                  inactiveColor: AppColorConstant.appRed,
                  activeColor: AppColorConstant.appGreen,
                  toggleSize: 25.0,
                  value: mastersController.isToggled,
                  borderRadius: 30.0,
                  onToggle: (val) => mastersController.onToggle(val),
                ),
              ],
            ),
            const SizedBox(height: 3),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  '1 kg',
                  color: AppColorConstant.appBlack,
                  fontWeight: FontWeight.w500,
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
            const SizedBox(height: 3),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AppText(
                      'Stock: ',
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
                    AppText('MRP ', color: AppColorConstant.appBlack),
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
            Container(
              height: 1,
              margin: const EdgeInsets.only(top: 10),
              color: AppColorConstant.appGrey.withOpacity(0.7),
            ),
          ],
        ),
      ),
    );
  }
}

class TodaysDealScreen extends StatelessWidget {
  final MastersController mastersController;

  const TodaysDealScreen({Key? key, required this.mastersController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            padding: const EdgeInsets.only(top: 8, bottom: 15),
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText('Daawat Basmati Rice 5kg',
                                color: AppColorConstant.appBlack, fontWeight: FontWeight.w500, maxLines: 2),
                            AppText('Foodgrains & Masalas ', color: AppColorConstant.appBlack, fontSize: 11),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      Row(
                        children: [
                          Icon(Icons.edit, size: 18),
                          SizedBox(width: 5),
                          AppImageAsset(image: AppAsset.deleteIcon, height: 23, width: 23),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AppText('Sale Price: ', color: AppColorConstant.appBlack, fontWeight: FontWeight.w500),
                              AppText('₹70',
                                  color: AppColorConstant.appBlack, fontWeight: FontWeight.w500, fontSize: 15),
                            ],
                          ),
                          Row(
                            children: [
                              AppText('MRP: ', color: AppColorConstant.appBlack, fontSize: 12),
                              AppText('₹75',
                                  color: AppColorConstant.appGrey,
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ],
                          ),
                        ],
                      ),
                      FlutterSwitch(
                        width: 50.px,
                        height: 26.px,
                        inactiveColor: AppColorConstant.appRed,
                        activeColor: AppColorConstant.appGreen,
                        toggleSize: 25.0,
                        value: mastersController.isToggled,
                        borderRadius: 30.0,
                        onToggle: (val) => mastersController.onToggle(val),
                      ),
                    ],
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
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 25),
          child: AppElevatedButton(
            buttonName: 'Add New Items',
            isIconShow: true,
            onPressed: () => Get.toNamed(RouteHelper.getAddItemRoute()),
            buttonColor: AppColorConstant.appBluest,
            fontWeight: FontWeight.w500,
            imageString: AppAsset.addIcon,
            buttonRadius: 5,
          ),
        ),
      ],
    );
  }
}
