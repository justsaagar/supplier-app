import 'package:flutter/material.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';

class ReviewOrderScreen extends StatelessWidget {
  const ReviewOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Review Order'),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(15),
        children: [
          const Row(
            children: [
              AppText('Status : '),
              AppText('Order Placed', color: AppColorConstant.appGreen),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              color: AppColorConstant.appGrey.withOpacity(0.3),
            ),
            child: const Row(
              children: [
                AppText(
                  'Order No : ',
                  color: AppColorConstant.appGrey,
                  fontWeight: FontWeight.w500,
                ),
                AppText(
                  '11357567',
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColorConstant.appGrey.withOpacity(0.5),
                  ),
                  right: BorderSide(
                    color: AppColorConstant.appGrey.withOpacity(0.5),
                  ),
                  left: BorderSide(
                    color: AppColorConstant.appGrey.withOpacity(0.5),
                  ),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: AppText(
                          'Retailer',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(child: AppText(':')),
                      Expanded(
                        flex: 4,
                        child: AppText('Suresh Store'),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    color: AppColorConstant.appGrey.withOpacity(0.5),
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: AppText(
                          'Products',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(child: AppText(':')),
                      Expanded(
                        flex: 4,
                        child: AppText('10'),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    color: AppColorConstant.appGrey.withOpacity(0.5),
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: AppText(
                          'Order time',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(child: AppText(':')),
                      Expanded(
                        flex: 4,
                        child: AppText('04 Aug 22 1:30pm'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: const Row(
              children: [
                AppText(
                  'Order Total : ',
                  color: AppColorConstant.appGrey,
                  fontWeight: FontWeight.w500,
                ),
                AppText(
                  '₹6,148',
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            decoration: const BoxDecoration(
              color: AppColorConstant.appYellow,
            ),
            child: const Row(
              children: [
                AppText('Items(4)',color: AppColorConstant.appWhite),
                AppText('Price',color: AppColorConstant.appWhite),
                AppText('Quantity',color: AppColorConstant.appWhite),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
