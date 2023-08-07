import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/app_text_form_field.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/add_new_invoice_controller.dart';
import 'package:supplier/routes/route_helper.dart';

class AddNewInVoiceScreen extends StatelessWidget {
  const AddNewInVoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'New Invoice'),
      body: GetBuilder(
        init: AddNewInVoiceController(),
        builder: (AddNewInVoiceController addNewInVoiceController) {
          return ListView(
            padding: const EdgeInsets.all(10),
            children: [
              AppTextFormField(
                controller: addNewInVoiceController.supplierNameController,
                hintText: '',
                isBorder: true,
                filedColor: AppColorConstant.appWhite,
                headerTitle: 'Product Name :',
              ),
              const SizedBox(height: 10),
              AppTextFormField(
                controller: addNewInVoiceController.inVoiceNumberController,
                hintText: '',
                isBorder: true,
                filedColor: AppColorConstant.appWhite,
                headerTitle: 'Invoice Number',
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: addNewInVoiceController.invoiceDateController,
                      hintText: '',
                      isBorder: true,
                      filedColor: AppColorConstant.appWhite,
                      readOnly: true,
                      onTap: () => addNewInVoiceController.selectDate(
                        context,
                        addNewInVoiceController.invoiceDate,
                        addNewInVoiceController.invoiceDateController,
                      ),
                      headerTitle: 'Order Date',
                      suffixIcon: const Icon(
                        Icons.calendar_month,
                        color: AppColorConstant.appGrey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: AppTextFormField(
                      controller: addNewInVoiceController.invoiceDateController,
                      hintText: '',
                      isBorder: true,
                      filedColor: AppColorConstant.appWhite,
                      readOnly: true,
                      onTap: () => addNewInVoiceController.selectDate(
                        context,
                        addNewInVoiceController.invoiceDate,
                        addNewInVoiceController.invoiceDateController,
                      ),
                      suffixIcon: const Icon(
                        Icons.calendar_month,
                        color: AppColorConstant.appGrey,
                      ),
                      headerTitle: 'Invoice Date',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              AppText(
                'Added items (3)',
                fontSize: 14.px,
                fontWeight: FontWeight.w500,
                color: AppColorConstant.appBlack,
              ),
              addedItems(),
              const SizedBox(height: 15),
              AppText(
                'Item Description',
                fontSize: 14.px,
                fontWeight: FontWeight.w500,
                color: AppColorConstant.appBlack,
              ),
              itemDescription(addNewInVoiceController),
            ],
          );
        },
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  itemDescription(AddNewInVoiceController addNewInVoiceController) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.px),
        border: Border.all(color: AppColorConstant.appGrey.withOpacity(0.5)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          AppTextFormField(
            controller: addNewInVoiceController.productNameController,
            hintText: '',
            isBorder: true,
            filedColor: AppColorConstant.appWhite,
            headerTitle: 'Product name',
          ),
          const SizedBox(height: 10),
          AppTextFormField(
            controller: addNewInVoiceController.productIdController,
            hintText: '',
            isBorder: true,
            filedColor: AppColorConstant.appWhite,
            headerTitle: 'Product ID',
          ),
          const SizedBox(height: 10),
          AppTextFormField(
            controller: addNewInVoiceController.mrpController,
            hintText: '',
            isBorder: true,
            filedColor: AppColorConstant.appWhite,
            headerTitle: 'MRP',
          ),
          const SizedBox(height: 10),
          AppTextFormField(
            controller: addNewInVoiceController.qtyController,
            hintText: '',
            isBorder: true,
            filedColor: AppColorConstant.appWhite,
            headerTitle: 'QTY',
          ),
          const SizedBox(height: 15),
          const AppElevatedButton(
            buttonName: 'Save',
            buttonColor: AppColorConstant.appGreen,
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  addedItems() {
    return Column(
      children: [
        Container(
          height: 40,
          margin: const EdgeInsets.only(top: 7),
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
              Expanded(
                flex: 4,
                child: AppText('Product'),
              ),
              Expanded(
                child: AppText('MRP'),
              ),
              Expanded(
                child: AppText(
                  'QTY',
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 25, width: 25)
            ],
          ),
        ),
        addedItemView(),
      ],
    );
  }

  addedItemView() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
        separatorBuilder: (context, index) => Container(
          height: 1,
          color: AppColorConstant.appGrey.withOpacity(0.5),
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: const Row(
            children: [
              Expanded(
                flex: 4,
                child: AppText(
                  'Mariegold Biscuit 250gm',
                  color: AppColorConstant.appBlack,
                  maxLines: 2,
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: AppText('₹70', color: AppColorConstant.appBlack),
              ),
              SizedBox(width: 5),
              Expanded(
                child: AppText(
                  '50',
                  color: AppColorConstant.appBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              AppImageAsset(
                image: AppAsset.deleteIcon,
                height: 25,
                width: 25,
              )
            ],
          ),
        ),
      ),
    );
  }

  bottomNavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1,
          margin: const EdgeInsets.only(bottom: 10),
          color: AppColorConstant.appGrey,
        ),
        AppElevatedButton(
          buttonName: 'Save Involice',
          onPressed: () => Get.toNamed(RouteHelper.getInvoiceDetailsRoute()),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          buttonColor: AppColorConstant.appBluest,
        ),
      ],
    );
  }
}
