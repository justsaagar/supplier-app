import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/delivery_controller.dart';
import 'package:supplier/screen/delivery_screen/delivery_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryRiderScreen extends StatelessWidget {
  const DeliveryRiderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: 'Deliver Partners',
        showBack: true,
      ),
      body: GetBuilder<DeliveryController>(
        init: DeliveryController(),
        initState: (state) {
          Future.delayed(
            const Duration(microseconds: 300),
            () => Get.find<DeliveryController>().getRiders(),
          );
        },
        builder: (logic) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColorConstant.semiGreyColor.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: AppText(
                            'Id ',
                            fontWeight: FontWeight.w600,
                            color: AppColorConstant.appBluest,
                            fontSize: 14,
                          ),
                        ),
                        const Expanded(
                          child: AppText(
                            ':  ',
                            fontWeight: FontWeight.w600,
                            color: AppColorConstant.appBluest,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: AppText(
                              '${logic.content[index].employeeProfileId} ',
                              color: AppColorConstant.appBluest,
                              fontSize: 13),
                        ),
                        const SizedBox(height: 25, width: 25),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: AppText(
                            'Name',
                            color: AppColorConstant.appBluest,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Expanded(
                          child: AppText(
                            ':',
                            fontWeight: FontWeight.w600,
                            color: AppColorConstant.appBluest,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: AppText(
                            '${logic.content[index].empName}',
                            color: AppColorConstant.appBluest,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 25, width: 25),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: AppText(
                            'Mob. number ',
                            color: AppColorConstant.appBluest,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Expanded(
                          child: AppText(
                            ':',
                            fontWeight: FontWeight.w600,
                            color: AppColorConstant.appBluest,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: AppText(
                            '${logic.content[index].phoneNumber}',
                            color: AppColorConstant.appBluest,
                            fontSize: 13,
                            maxLines: 2,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              makePhoneCall(logic.content[index].phoneNumber!),
                          child: Container(
                              height: 25,
                              width: 25,
                              decoration: const BoxDecoration(
                                color: AppColorConstant.appBlack,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.call,
                                size: 15,
                                color: AppColorConstant.appWhite,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: logic.content.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const DeliveryScreen()),
        backgroundColor: AppColorConstant.appBluest,
        child: const Icon(Icons.add, color: AppColorConstant.appWhite),
      ),
    );
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
