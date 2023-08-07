import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/analytics_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Analytics'),
      body: GetBuilder(
          init: AnalyticsController(),
          builder: (AnalyticsController analyticsController) {
            return ListView(
              shrinkWrap: true,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => cardView(
                        title: analyticsController.analysisItemList[index]['title'],
                        rupees: analyticsController.analysisItemList[index]['rupees'],
                        image: AppAsset.productIcon,
                        analyticsController: analyticsController,
                        isRight: index == 2,
                        index: index,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        2,
                        (index) => cardView(
                              title: analyticsController.analysisItemList[index + 3]['title'],
                              rupees: analyticsController.analysisItemList[index + 3]['rupees'],
                              image: AppAsset.productIcon,
                              analyticsController: analyticsController,
                              index: index + 3,
                            )),
                  ),
                ),
                if (analyticsController.selectedIndex != -1) firstChartView(analyticsController),
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  itemCount: analyticsController.firstChartList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      AppText(
                        analyticsController.firstChartList[index]['subTitle'],
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: analyticsController.firstChartList[index]['color'],
                      ),
                      AppText(
                        analyticsController.firstChartList[index]['title'],
                        fontSize: 11,
                        color: analyticsController.firstChartList[index]['color'],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: AppText(
                    'Top Performing Categories',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                secondChartView(analyticsController),
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  itemCount: analyticsController.secondChartList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      AppText(
                        analyticsController.secondChartList[index]['subTitle'],
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: analyticsController.secondChartList[index]['color'],
                      ),
                      AppText(
                        analyticsController.secondChartList[index]['title'],
                        fontSize: 10,
                        textAlign: TextAlign.center,
                        color: analyticsController.secondChartList[index]['color'],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  cardView(
      {String title = '',
      String rupees = '',
      String image = '',
      int index = 0,
      bool isRight = false,
      AnalyticsController? analyticsController}) {
    return Center(
      child: GestureDetector(
        onTap: () => analyticsController.selectCard(index),
        child: Container(
          height: 105.px,
          width: 95.px,
          margin: EdgeInsets.only(right: isRight ? 0 : 12),
          decoration: BoxDecoration(
            color: analyticsController!.selectedIndex == index ? AppColorConstant.appBluest : AppColorConstant.appWhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColorConstant.appGrey.withOpacity(0.3),
                blurRadius: 4,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              AppImageAsset(image: image, height: 25, width: 25),
              const SizedBox(height: 10),
              AppText(
                title,
                fontSize: 10,
                color:
                    analyticsController.selectedIndex == index ? AppColorConstant.appWhite : AppColorConstant.appBlack,
              ),
              const SizedBox(height: 5),
              AppText(
                rupees,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color:
                    analyticsController.selectedIndex == index ? AppColorConstant.appWhite : AppColorConstant.appBlack,
              )
            ],
          ),
        ),
      ),
    );
  }
}

firstChartView(AnalyticsController analyticsController) {
  return Stack(
    alignment: Alignment.center,
    children: [
      AppText(
        analyticsController.analysisItemList[analyticsController.selectedIndex]['title']
            .toString()
            .replaceAll(' ', '\n'),
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w500,
      ),
      SizedBox(
        height: 250,
        width: 250,
        child: SfCircularChart(
          palette: analyticsController.firstColorList,
          series: <CircularSeries>[
            DoughnutSeries<ChartData, String>(
              innerRadius: '58%',
              dataSource: <ChartData>[
                ChartData('Category 2', 28),
                ChartData('Category 3', 28),
                ChartData('Category 1', 45),
              ],
              xValueMapper: (ChartData data, _) => data.category,
              yValueMapper: (ChartData data, _) => data.value,
            ),
          ],
        ),
      ),
    ],
  );
}

secondChartView(AnalyticsController analyticsController) {
  return Stack(
    alignment: Alignment.center,
    children: [
      const AppText(
        'Categories',
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w500,
      ),
      SizedBox(
        height: 250,
        width: 250,
        child: SfCircularChart(
          palette: analyticsController.secondColorList,
          series: <CircularSeries>[
            DoughnutSeries<ChartData, String>(
              innerRadius: '58%',
              dataSource: <ChartData>[
                ChartData('Category 2', 28),
                ChartData('Category 3', 28),
                ChartData('Category 1', 28),
                ChartData('Category 1', 10),
                ChartData('Category 1', 12),
                ChartData('Category 1', 15),
                ChartData('Category 1', 15),
                ChartData('Category 1', 10),
              ],
              xValueMapper: (ChartData data, _) => data.category,
              yValueMapper: (ChartData data, _) => data.value,
            ),
          ],
        ),
      ),
    ],
  );
}

class ChartData {
  ChartData(this.category, this.value);

  final String category;
  final double value;
}
