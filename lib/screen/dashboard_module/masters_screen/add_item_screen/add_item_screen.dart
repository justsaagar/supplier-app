import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_dropdown.dart';
import 'package:supplier/app/widget/app_elevated_button.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/app_text_form_field.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/add_item_controller.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Add Item'),
      body: GetBuilder(
          init: AddItemController(),
          builder: (AddItemController addItemController) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              children: [
                const SizedBox(height: 15),
                AppTextFormField(
                  controller: addItemController.productNameController,
                  hintText: '',
                  isBorder: true,
                  filedColor: AppColorConstant.appWhite,
                  headerTitle: 'Product Name :',
                ),
                const SizedBox(height: 15),
                AppTextFormField(
                  controller: addItemController.mrpController,
                  hintText: '',
                  isBorder: true,
                  filedColor: AppColorConstant.appWhite,
                  headerTitle: 'MRP :',
                ),
                const SizedBox(height: 15),
                AppTextFormField(
                  controller: addItemController.sellingPriceController,
                  hintText: '',
                  isBorder: true,
                  filedColor: AppColorConstant.appWhite,
                  headerTitle: 'Selling Price :',
                ),
                const SizedBox(height: 15),
                AppTextFormField(
                  controller: addItemController.discountController,
                  hintText: '',
                  isBorder: true,
                  filedColor: AppColorConstant.appWhite,
                  headerTitle: 'Discount :',
                ),
                const SizedBox(height: 15),
                AppDropdownButton(
                  headerTitle: 'Discount Type :',
                  title: 'Select Discount Type',
                  value: addItemController.selectedDiscountType,
                  onChanged: (value) {
                    addItemController.selectedDiscountType = value ?? '';
                    addItemController.update();
                  },
                  items: List.generate(
                    addItemController.discountTypeList.length,
                    (index) => DropdownMenuItem(
                      value: addItemController.discountTypeList[index],
                      child: AppText(
                        addItemController.discountTypeList[index],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                AppTextFormField(
                  controller: addItemController.discountedPriceController,
                  hintText: '',
                  isBorder: true,
                  filedColor: AppColorConstant.appWhite,
                  headerTitle: 'Discounted Price :',
                ),
                const SizedBox(height: 15),
                AppTextFormField(
                  controller: addItemController.quantityController,
                  hintText: '',
                  isBorder: true,
                  filedColor: AppColorConstant.appWhite,
                  headerTitle: "Quantity for Today's deal :",
                ),
                const SizedBox(height: 15),
                AppTextFormField(
                  controller: addItemController.descriptionController,
                  hintText: '',
                  isBorder: true,
                  filedColor: AppColorConstant.appWhite,
                  headerTitle: 'Description',
                ),
                const SizedBox(height: 15),
                AppTextFormField(
                  controller: addItemController.couponApplicableController,
                  hintText: '',
                  isBorder: true,
                  filedColor: AppColorConstant.appWhite,
                  headerTitle: 'Coupon Applicable',
                ),
                const SizedBox(height: 15),
                AppTextFormField(
                  controller: addItemController.startDateController,
                  hintText: '',
                  readOnly: true,
                  onTap: () => addItemController.selectDate(
                      context, addItemController.startDate, addItemController.startDateController),
                  isBorder: true,
                  filedColor: AppColorConstant.appWhite,
                  headerTitle: 'Start Date',
                ),
                const SizedBox(height: 15),
                AppTextFormField(
                  controller: addItemController.endDateController,
                  hintText: '',
                  readOnly: true,
                  onTap: () => addItemController.selectDate(
                      context, addItemController.endDate, addItemController.endDateController),
                  isBorder: true,
                  filedColor: AppColorConstant.appWhite,
                  headerTitle: 'End Date',
                ),
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Expanded(
                      child: AppElevatedButton(
                        buttonName: 'Cancel',
                        isBorderShape: true,
                        borderColor: AppColorConstant.appBlack,
                        buttonColor: AppColorConstant.appBluest,
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: AppElevatedButton(
                        buttonName: 'Save',
                        buttonColor: AppColorConstant.appBluest,
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}
