import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/routes/route_helper.dart';
import 'package:supplier/utils/date_format_service.dart';
import 'package:supplier/utils/utils.dart';

import '../../../controller/edit_profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return GetBuilder(
        init: EditProfileController(),
        builder: (EditProfileController editProfileController) {
          return Column(
            children: [
              SizedBox(height: 15.px),
              if (editProfileController.storeProfileModel != null)
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16.px),
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 12.px, horizontal: 12.px),
                            decoration: BoxDecoration(
                                color: AppColorConstant.appWhite,
                                borderRadius: BorderRadius.circular(10.px),
                                border: Border.all(color: AppColorConstant.appGrey)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 110,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: AppImageAsset(
                                      image: editProfileController.storeProfileModel!.imageUrl!.bannerImageId!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 70.px),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(editProfileController.storeProfileModel!.storeName ?? '',
                                        fontSize: 18, fontWeight: FontWeight.w500),
                                    const AppImageAsset(
                                      image: AppAsset.mapIcon,
                                      color: AppColorConstant.appYellow,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const AppText('Store Rating', fontSize: 13),
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => Icon(
                                          Icons.star,
                                          size: 16,
                                          color: index == editProfileController.storeProfileModel!.storeRating
                                              ? AppColorConstant.appYellow
                                              : AppColorConstant.appGrey.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                    AppText('(${editProfileController.storeProfileModel!.storeRating!.length})',
                                        fontSize: 13),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Expanded(flex: 2, child: AppText('Application Status', fontSize: 13)),
                                    Expanded(
                                      flex: 3,
                                      child: AppText(' : ${editProfileController.storeProfileModel!.applicationStatus}',
                                          fontSize: 13, color: AppColorConstant.appGreen, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Expanded(flex: 2, child: AppText('Store Status', fontSize: 13)),
                                    Expanded(
                                      flex: 3,
                                      child: AppText(' : ${editProfileController.storeProfileModel!.storeLiveStatus}',
                                          fontSize: 13, color: AppColorConstant.appRed, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Expanded(flex: 2, child: AppText('Onboarded On', fontSize: 13)),
                                    if (editProfileController.storeProfileModel!.applicationStatusDate != null)
                                      Expanded(
                                          flex: 3,
                                          child: AppText(
                                              ' : ${DateFormatUtills.instance.getBirthDateFormattedDateTime(editProfileController.storeProfileModel!.applicationStatusDate!)}',
                                              fontSize: 13)),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                        child: commonButton(
                                      'Edit Profile',
                                      Icons.edit,
                                      () => Get.toNamed(RouteHelper.getEditProfileRoute()),
                                    )),
                                    const SizedBox(width: 18),
                                    Expanded(
                                        child: commonButton('Share my store', Icons.share, () {},
                                            borderColor: AppColorConstant.appYellow)),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 110,
                            width: 110,
                            margin: const EdgeInsets.only(bottom: 100),
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColorConstant.appWhite),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColorConstant.appGrey, width: 3)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: AppImageAsset(
                                    image: editProfileController.storeProfileModel!.imageUrl!.profileImageId!),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 16.px),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.px, horizontal: 12.px),
                        decoration: BoxDecoration(
                            color: AppColorConstant.appWhite,
                            borderRadius: BorderRadius.circular(10.px),
                            border: Border.all(color: AppColorConstant.appGrey)
                            // boxShadow: AppColorConstant.appBoxShadow,
                            ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText('Business Details', fontWeight: FontWeight.w600),
                            SizedBox(height: 16.px),
                            buildProfileDetails(
                                'Business', editProfileController.storeProfileModel!.businessType ?? ''),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Store name', '${editProfileController.storeProfileModel!.storeName}'),
                            SizedBox(height: 16.px),
                            buildProfileDetails(
                                'Store number', editProfileController.storeProfileModel!.storeNumber ?? ''),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Owner', editProfileController.storeProfileModel!.ownerName ?? ''),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.px),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.px, horizontal: 12.px),
                        decoration: BoxDecoration(
                            color: AppColorConstant.appWhite,
                            borderRadius: BorderRadius.circular(10.px),
                            border: Border.all(color: AppColorConstant.appGrey)
                            // boxShadow: AppColorConstant.appBoxShadow,
                            ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText('Bank Details', fontWeight: FontWeight.w600),
                            SizedBox(height: 16.px),
                            buildProfileDetails(
                                'Account number', editProfileController.storeProfileModel!.accountNumber ?? ''),
                            SizedBox(height: 16.px),
                            buildProfileDetails(
                                'Account name', editProfileController.storeProfileModel!.accuntName ?? ''),
                            SizedBox(height: 16.px),
                            buildProfileDetails('IFSC code', editProfileController.storeProfileModel!.ifsc ?? ''),
                            SizedBox(height: 16.px),
                            buildProfileDetails(
                                'Bank branch', editProfileController.storeProfileModel!.bankbranch ?? ''),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Bank name', editProfileController.storeProfileModel!.bank ?? ''),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Google pay', editProfileController.storeProfileModel!.googlepay ?? ''),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Phone pay', editProfileController.storeProfileModel!.phonepay ?? ''),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Paytm', editProfileController.storeProfileModel!.paytm ?? ''),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.px),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.px, horizontal: 12.px),
                        decoration: BoxDecoration(
                            color: AppColorConstant.appWhite,
                            borderRadius: BorderRadius.circular(10.px),
                            border: Border.all(color: AppColorConstant.appGrey)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText('Contact', fontWeight: FontWeight.w600),
                            SizedBox(height: 16.px),
                            buildProfileDetails(
                                'Mobile Number', editProfileController.storeProfileModel!.phoneNumber ?? ''),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Email', editProfileController.storeProfileModel!.email ?? ''),
                            SizedBox(height: 16.px),
                            buildProfileDetails(
                                'Application Started date',
                                DateFormatUtills.instance.getBirthDateFormattedDateTime(
                                    editProfileController.storeProfileModel!.applicationStatusDate!)),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Child 1 birth date', '04/02/1970 dummy'),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Child 2 birth date', '04/02/1970 dummy'),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Address',
                                editProfileController.storeProfileModel!.storeAddressDetailRequest[0].addressLine1!),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Deals in', editProfileController.storeProfileModel!.dealsIn ?? ''),
                            buildProfileDetails('Popular in', editProfileController.storeProfileModel!.popularIn ?? ''),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.px),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.px, horizontal: 12.px),
                        decoration: BoxDecoration(
                            color: AppColorConstant.appWhite,
                            borderRadius: BorderRadius.circular(10.px),
                            border: Border.all(color: AppColorConstant.appGrey)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText('Licence', fontWeight: FontWeight.w600),
                            SizedBox(height: 16.px),
                            buildProfileDetails('GST', editProfileController.storeProfileModel!.gst!.gstNumber ?? ''),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Store License',
                                editProfileController.storeProfileModel!.storeLicense!.storeLicenseNumber ?? ''),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.px),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.px, horizontal: 12.px),
                        decoration: BoxDecoration(
                            color: AppColorConstant.appWhite,
                            borderRadius: BorderRadius.circular(10.px),
                            border: Border.all(color: AppColorConstant.appGrey)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText('Store Timing info', fontWeight: FontWeight.w600),
                            SizedBox(height: 16.px),
                            buildProfileDetails(
                                'Opening time', editProfileController.storeProfileModel!.openTime ?? ''),
                            SizedBox(height: 16.px),
                            buildProfileDetails(
                                'Closing time', editProfileController.storeProfileModel!.closeTime ?? ''),
                            SizedBox(height: 16.px),
                            buildProfileDetails(
                                'Delivery strength', editProfileController.storeProfileModel!.deliveryStrength ?? ''),
                            SizedBox(height: 16.px),
                            const AppText('Slots :', fontWeight: FontWeight.w500),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Forenoon',
                                '${editProfileController.storeProfileModel!.slots[0].startTime ?? ''} - ${editProfileController.storeProfileModel!.slots[0].endTime ?? ''}'),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Afternoon',
                                '${editProfileController.storeProfileModel!.slots[1].startTime ?? ''} - ${editProfileController.storeProfileModel!.slots[1].endTime ?? ''}'),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Late Afternoon',
                                '${editProfileController.storeProfileModel!.slots[2].startTime ?? ''} - ${editProfileController.storeProfileModel!.slots[2].endTime ?? ''}'),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Evening',
                                '${editProfileController.storeProfileModel!.slots[3].startTime ?? ''} - ${editProfileController.storeProfileModel!.slots[3].endTime ?? ''}'),
                            SizedBox(height: 16.px),
                            buildProfileDetails('Morning',
                                '${editProfileController.storeProfileModel!.slots[4].startTime ?? ''} - ${editProfileController.storeProfileModel!.slots[4].endTime ?? ''}'),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10.px, horizontal: 12.px),
                        margin: EdgeInsets.symmetric(vertical: 10.px),
                        decoration: BoxDecoration(
                            color: AppColorConstant.appWhite,
                            borderRadius: BorderRadius.circular(10.px),
                            border: Border.all(color: AppColorConstant.appGrey)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText(
                              'Message to customer from retailer :',
                              fontWeight: FontWeight.w600,
                              maxLines: 2,
                            ),
                            AppText(
                              editProfileController.storeProfileModel!.reason ?? '',
                              maxLines: 2,
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
        });
  }

  Row buildProfileDetails(String headerTitle, String bodyText) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: AppText(
            '$headerTitle:',
            fontWeight: FontWeight.w500,
            maxLines: 2,
          ),
        ),
        Expanded(flex: 5, child: AppText(bodyText)),
      ],
    );
  }

  commonButton(String title, IconData icon, void Function()? onTap, {Color borderColor = AppColorConstant.appBlack}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        decoration: BoxDecoration(border: Border.all(color: borderColor), borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 5),
            AppText(
              title,
              fontSize: 12,
            )
          ],
        ),
      ),
    );
  }
}
