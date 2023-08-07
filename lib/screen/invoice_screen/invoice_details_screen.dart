import 'package:flutter/material.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';

class InVoiceDetailsScreen extends StatelessWidget {
  const InVoiceDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Invoice'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
          invoiceDetailsView(),
          addedItems(),
        ],
      ),
    );
  }

  invoiceDetailsView() {
    return const Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'Supplier Name',
                color: AppColorConstant.appGrey,
              ),
              AppText(
                'Mishra Enterprises',
                maxLines: 2,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 15),
              AppText(
                'Invoice Date',
                color: AppColorConstant.appGrey,
              ),
              AppText(
                '04/08/2022',
                maxLines: 2,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'Invoice Number',
                color: AppColorConstant.appGrey,
              ),
              AppText(
                  '1223546465',
                  maxLines: 2,
                  fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 15),
              AppText(
                'Order Date',
                color: AppColorConstant.appGrey,
              ),
              AppText(
                  '04/08/2022',
                  maxLines: 2,
                  fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ],
    );
  }

  addedItems() {
    return Column(
      children: [
        Container(
          height: 40,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
            color: AppColorConstant.appYellow,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
          child: const Row(
            children: [
              Expanded(flex: 6, child: AppText('Product',color: AppColorConstant.appWhite)),
              Expanded(child: AppText('MRP',color: AppColorConstant.appWhite)),
              Expanded(child: AppText('QTY',color: AppColorConstant.appWhite, textAlign: TextAlign.end)),
            ],
          ),
        ),
        addedItemView(),
      ],
    );
  }

  addedItemView() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        border: Border.all(color: AppColorConstant.appGrey.withOpacity(0.5)),
      ),
      child: ListView.separated(
        itemCount: 3,
        shrinkWrap: true,
        separatorBuilder: (context, index) =>
            Container(
              height: 1,
              color: AppColorConstant.appGrey.withOpacity(0.5),
            ),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) =>
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: AppText(
                      'Mariegold Biscuit 250gm',
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: AppText('₹70'),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: AppText(
                      '50',
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
