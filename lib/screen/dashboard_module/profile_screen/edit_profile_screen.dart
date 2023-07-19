import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/app_text_form_field.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/controller/edit_profile_controller.dart';
import 'package:supplier/utils/utils.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
      builder: (EditProfileController editProfileController) {
        return Scaffold(
          appBar: AppAppBar(appBarHeight: 60.px),
          body: ListView(
            padding: EdgeInsets.all(24.px),
            children: [
              AppTextFormField(
                controller: editProfileController.ownerNameController,
                hintText: 'Enter Owner Name',
                headerTitle: 'Owner Name',
                isLightMode: true,
              ),
              SizedBox(height: 16.px),
              AppTextFormField(
                controller: editProfileController.storeNameController,
                hintText: 'Enter your Store Name',
                headerTitle: 'Store Name',
                isLightMode: true,
              ),
              SizedBox(height: 16.px),
              AppTextFormField(
                controller: editProfileController.mobileNumberController,
                headerTitle: 'Mobile number',
                hintText: 'Enter mobile number',
                isLightMode: true,
                prefixIcon: IntlPhoneField(
                  flagsButtonMargin: EdgeInsets.zero,
                  onCountryChanged: (Country value) => editProfileController.onCountryChange(value),
                  initialCountryCode: 'IN',
                  showDropdownIcon: false,
                  showCountryFlag: false,
                  validator: (p0) => null,
                  readOnly: true,
                  style: TextStyle(
                    fontFamily: AppAsset.defaultFont,
                    fontSize: 14.px,
                    fontWeight: FontWeight.w600,
                    color: AppColorConstant.appRed,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    prefixIcon: const SizedBox(),
                    prefixStyle: TextStyle(
                      fontFamily: AppAsset.defaultFont,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w600,
                      color: AppColorConstant.appRed,
                    ),
                    labelStyle: TextStyle(
                      fontFamily: AppAsset.defaultFont,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w600,
                      color: AppColorConstant.appWhite,
                    ),
                    suffixIconConstraints: BoxConstraints(minHeight: 2.px, minWidth: 4.px),
                    suffixIcon: const SizedBox(),
                    contentPadding: EdgeInsets.zero,
                    counterText: '',
                  ),
                ),
              ),
              SizedBox(height: 16.px),
              AppTextFormField(
                controller: editProfileController.storeNameController,
                hintText: 'Enter email',
                headerTitle: 'Email',
                isLightMode: true,
              ),
              SizedBox(height: 16.px),
              AppTextFormField(
                controller: editProfileController.storeNameController,
                headerTitle: 'Wedding anniversary date',
                hintText: 'DD/MM/YYYY',
                isLightMode: true,
                suffixIcon: const Icon(Icons.calendar_today, color: AppColorConstant.appGrey),
              ),
              SizedBox(height: 16.px),
              AppTextFormField(
                controller: editProfileController.storeNameController,
                headerTitle: 'Child 1 birth date',
                hintText: 'DD/MM/YYYY',
                isLightMode: true,
                suffixIcon: const Icon(Icons.calendar_today, color: AppColorConstant.appGrey),
              ),
              SizedBox(height: 16.px),
              AppTextFormField(
                controller: editProfileController.storeNameController,
                headerTitle: 'Child 2 birth date',
                hintText: 'DD/MM/YYYY',
                isLightMode: true,
                suffixIcon: const Icon(Icons.calendar_today, color: AppColorConstant.appGrey),
              ),
              SizedBox(height: 16.px),
              AppTextFormField(
                controller: editProfileController.storeNameController,
                headerTitle: 'Address',
                hintText: 'Enter address',
                isLightMode: true,
              ),
              SizedBox(height: 16.px),
              AppTextFormField(
                controller: editProfileController.storeNameController,
                headerTitle: 'Area',
                hintText: 'Enter area',
                isLightMode: true,
              ),
              SizedBox(height: 16.px),
              AppTextFormField(
                controller: editProfileController.storeNameController,
                headerTitle: 'Deals in',
                hintText: '',
                isLightMode: true,
              ),
              SizedBox(height: 16.px),
              AppTextFormField(
                controller: editProfileController.storeNameController,
                headerTitle: 'Popular in',
                hintText: '',
                isLightMode: true,
              ),
              SizedBox(height: 16.px),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: editProfileController.storeNameController,
                      headerTitle: 'GST',
                      hintText: 'Enter GST number',
                      isLightMode: true,
                      readOnly: true,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30.px, left: 12.px),
                    child: AppImageAsset(image: AppAsset.approveIcon, height: 22.px, width: 22.px),
                  ),
                  SizedBox(width: 4.px),
                  Container(
                    padding: EdgeInsets.only(top: 30.px),
                    child: AppImageAsset(image: AppAsset.deleteIcon, height: 22.px, width: 22.px),
                  ),
                ],
              ),
              SizedBox(height: 16.px),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: editProfileController.storeNameController,
                      headerTitle: 'Store License',
                      hintText: 'Enter License number',
                      isLightMode: true,
                      readOnly: true,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30.px, left: 12.px),
                    child: AppImageAsset(image: AppAsset.approveIcon, height: 22.px, width: 22.px),
                  ),
                  SizedBox(width: 4.px),
                  Container(
                    padding: EdgeInsets.only(top: 30.px),
                    child: AppImageAsset(image: AppAsset.deleteIcon, height: 22.px, width: 22.px),
                  ),
                ],
              ),
              SizedBox(height: 16.px),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: editProfileController.storeNameController,
                      headerTitle: 'Drug License',
                      hintText: 'Enter License number',
                      isLightMode: true,
                      readOnly: true,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30.px, left: 12.px),
                    child: AppImageAsset(image: AppAsset.approveIcon, height: 22.px, width: 22.px),
                  ),
                  SizedBox(width: 4.px),
                  Container(
                    padding: EdgeInsets.only(top: 30.px),
                    child: AppImageAsset(image: AppAsset.deleteIcon, height: 22.px, width: 22.px),
                  ),
                ],
              ),
              SizedBox(height: 16.px),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 46.px,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColorConstant.appBluest),
                        borderRadius: BorderRadius.circular(6.px),
                      ),
                      child: const AppText('Cancel', color: AppColorConstant.appBluest, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(width: 16.px),
                  Expanded(
                    child: Container(
                      height: 46.px,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColorConstant.appBluest,
                        borderRadius: BorderRadius.circular(6.px),
                      ),
                      child: const AppText('Save', color: AppColorConstant.appWhite, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
