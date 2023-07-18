import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/home_controller.dart';
import 'package:supplier/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (HomeController homeController) {
        return Column(
          children: [
            SizedBox(height: 32.px),
            StreamBuilder<int>(
              initialData: 0,
              stream: homeController.buyingGuidesController,
              builder: (context, AsyncSnapshot<int> snapshot) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider.builder(
                      itemCount: 4,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 26.px),
                          width: Device.width,
                          decoration: BoxDecoration(
                            color: AppColorConstant.appOrange,
                            borderRadius: BorderRadius.circular(8.px),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: 125.px,
                        autoPlay: true,
                        onPageChanged: (index, reason) => homeController.buyingGuidesController.add(index),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.px),
                      child: AnimatedSmoothIndicator(
                        count: 4,
                        effect: ExpandingDotsEffect(
                            activeDotColor: const Color(0xFF614B00),
                            dotColor: const Color(0xFFC99D00),
                            dotHeight: 8.px,
                            dotWidth: 8.px,
                            expansionFactor: 2.px),
                        activeIndex: snapshot.data ?? 0,
                      ),
                    )
                  ],
                );
              },
            ),
            SizedBox(height: 6.px),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 26.px),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 160.px,
                  crossAxisSpacing: 22.px,
                  mainAxisSpacing: 22.px,
                ),
                itemCount: homeController.homeOptions.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColorConstant.appWhite,
                      boxShadow: AppColorConstant.appBoxShadow,
                      borderRadius: BorderRadius.circular(10.px),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppImageAsset(image: homeController.homeOptions[index]['image'], height: 70.px, width: 70.px),
                        SizedBox(height: 10.px),
                        AppText(homeController.homeOptions[index]['name'], color: AppColorConstant.appBluest),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
