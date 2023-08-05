import 'package:flutter/material.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';

class RetailersDetailsView extends StatelessWidget {
  const RetailersDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Retailers'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            retailersNameView(),
            Container(
              height: 1,
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              color: AppColorConstant.appGrey.withOpacity(0.7),
            ),
            retailersProductView(),
          ],
        ),
      ),
    );
  }

  retailersNameView() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          'M. Srinivas',
          color: AppColorConstant.appGrey,
          fontWeight: FontWeight.w500,
        ),
        AppText(
          'Order count: 4',
          color: AppColorConstant.appGrey,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }

  retailersProductView() {
    return Flexible(
      child: Container(
        decoration: AppColorConstant.boxDecoration,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) => Container(
            color: AppColorConstant.appWhite,
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AppText('ORDER ', color: AppColorConstant.appBlack),
                        AppText(
                          '#53785452 ',
                          color: AppColorConstant.appBlack,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    AppText(
                      '2 October 2022',
                      color: AppColorConstant.appBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const AppImageAsset(image: AppAsset.chanaPackDummy, height: 60, width: 60),
                    const AppImageAsset(image: AppAsset.chanaDummy, height: 60, width: 60),
                    const SizedBox(width: 5),
                    Container(
                      height: 28,
                      width: 28,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColorConstant.appGrey,
                        ),
                      ),
                      child: const AppText(
                        '+2',
                        fontSize: 12,
                        color: AppColorConstant.appBlack,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 7),
                const Row(
                  children: [
                    AppText('Total: ', color: AppColorConstant.appBlack),
                    AppText('₹128', color: AppColorConstant.appBlack, fontWeight: FontWeight.w500),
                  ],
                ),
                const SizedBox(height: 3),
                const AppText(
                  'Delivered 05 -October -2022 ',
                  color: AppColorConstant.appBlack,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 1,
              color: AppColorConstant.appGrey.withOpacity(0.5),
            );
          },
        ),
      ),
    );
  }
}
