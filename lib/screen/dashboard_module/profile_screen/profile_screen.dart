import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/controller/edit_profile_controller.dart';
import 'package:supplier/routes/route_helper.dart';
import 'package:supplier/utils/date_utils.dart';
import 'package:supplier/utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
      initState: (state) {
        Future.delayed(
          const Duration(microseconds: 300),
          () {
            final editProfileController = Get.find<EditProfileController>();
            editProfileController.getStoreProfile();
          },
        );
      },
      builder: (EditProfileController editProfileController) {
        return Column(
          children: [
            SizedBox(height: 40.px),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Row(
                children: [
                  AppText(
                    AppStringConstants.storeName,
                    color: AppColorConstant.appYellow,
                    fontSize: 20.px,
                    fontWeight: FontWeight.w600,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Get.toNamed(RouteHelper.getEditProfileRoute()),
                    child: Container(
                      height: 40.px,
                      padding: EdgeInsets.symmetric(horizontal: 8.px),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.px),
                        border: Border.all(color: AppColorConstant.appBluest),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.edit),
                          SizedBox(width: 2.px),
                          AppText(
                            'Edit Profile',
                            fontSize: 12.px,
                            fontWeight: FontWeight.w500,
                            color: AppColorConstant.appBluest,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.px),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 16.px, horizontal: 12.px),
                    decoration: BoxDecoration(
                      color: AppColorConstant.appWhite,
                      borderRadius: BorderRadius.circular(10.px),
                      boxShadow: AppColorConstant.appBoxShadow,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppText('Business Details', fontWeight: FontWeight.w600),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Business type', editProfileController.storeProfileModel?.businessType ?? ''),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Business', editProfileController.storeProfileModel?.storeCategory ?? ''),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Store name', editProfileController.storeProfileModel?.storeName ?? ''),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Store number', editProfileController.storeProfileModel?.storeNumber ?? ''),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Owner', editProfileController.storeProfileModel?.ownerName ?? ''),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Registered Pharmacist', editProfileController.storeProfileModel?.registeredPharmacistName ?? ''),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.px),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16.px, horizontal: 12.px),
                    decoration: BoxDecoration(
                      color: AppColorConstant.appWhite,
                      borderRadius: BorderRadius.circular(10.px),
                      boxShadow: AppColorConstant.appBoxShadow,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppText('Contact', fontWeight: FontWeight.w600),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Mobile Number', editProfileController.storeProfileModel?.phoneNumber ?? ''),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Email', editProfileController.storeProfileModel?.email ?? ''),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Wedding anniversary date', DateTimeUtils.getStoreBirthDateTime(editProfileController.storeProfileModel?.retailerMarriageDay ?? DateTime.now())),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Child 1 birth date', DateTimeUtils.getStoreBirthDateTime(editProfileController.storeProfileModel?.retailerChildOneBirthDay ?? DateTime.now())),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Child 2 birth date', DateTimeUtils.getStoreBirthDateTime(editProfileController.storeProfileModel?.retailerChildTwoBirthDay ?? DateTime.now())),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Address', editProfileController.storeProfileModel?.storeAddressDetailRequest.first.addressLine1 ?? ''),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Area', editProfileController.storeProfileModel?.storeAddressDetailRequest.first.landMark ?? ''),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.px),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16.px, horizontal: 12.px),
                    decoration: BoxDecoration(
                      color: AppColorConstant.appWhite,
                      borderRadius: BorderRadius.circular(10.px),
                      boxShadow: AppColorConstant.appBoxShadow,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppText('Licence', fontWeight: FontWeight.w600),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Deals in', editProfileController.storeProfileModel?.dealsIn ?? ''),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Popular in', editProfileController.storeProfileModel?.popularIn ?? ''),
                        SizedBox(height: 16.px),
                        buildProfileDetails('GST', editProfileController.storeProfileModel?.gst?.gstNumber ?? ''),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Store License', editProfileController.storeProfileModel?.storeLicense?.storeLicenseNumber ?? ''),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Drug License', editProfileController.storeProfileModel?.drugLicense?.drugLicenseNumber ?? ''),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.px),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16.px, horizontal: 12.px),
                    decoration: BoxDecoration(
                      color: AppColorConstant.appWhite,
                      borderRadius: BorderRadius.circular(10.px),
                      boxShadow: AppColorConstant.appBoxShadow,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppText('Store Timing info', fontWeight: FontWeight.w600),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Store opening time', editProfileController.storeProfileModel?.openTime ?? ''),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Store closing time', editProfileController.storeProfileModel?.closeTime ?? ''),
                        SizedBox(height: 16.px),
                        buildProfileDetails('Delivery strength', editProfileController.storeProfileModel?.deliveryStrength ?? ''),
                        SizedBox(height: 16.px),
                        SizedBox(
                          width: Device.width / 3.4,
                          child: const AppText(
                            'Slot :             ',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            editProfileController.storeProfileModel?.slots.length ?? 0,
                            (index) => AppText(
                              '${editProfileController.storeProfileModel?.slots[index].slotName ?? ''} slot : ${editProfileController.storeProfileModel?.slots[index].startTime ?? ''} - ${editProfileController.storeProfileModel?.slots[index].endTime ?? ''}',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.px),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Row buildProfileDetails(String headerTitle, String bodyText) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: Device.width / 3.4,
          child: AppText(
            headerTitle,
            fontWeight: FontWeight.w500,
          ),
        ),
        const AppText(' : ', fontWeight: FontWeight.w500),
        Expanded(child: AppText(bodyText)),
      ],
    );
  }
}
