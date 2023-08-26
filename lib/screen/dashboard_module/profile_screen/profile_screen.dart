import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/app_asset.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/routes/route_helper.dart';
import 'package:supplier/utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return Column(
      children: [
        SizedBox(height: 15.px),
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
                        Container(
                          height: 110,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 12.px),
                          decoration: BoxDecoration(
                            color: AppColorConstant.appBluest,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: const AppImageAsset(image: AppAsset.customerIcon),
                          ),
                        ),
                        SizedBox(height: 50.px),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText('MySaa', fontSize: 18, fontWeight: FontWeight.w500),
                            AppImageAsset(
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
                                  color: index == 0 || index == 1
                                      ? AppColorConstant.appYellow
                                      : AppColorConstant.appGrey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            const AppText('(5)', fontSize: 13),
                          ],
                        ),
                        const Row(
                          children: [
                            Expanded(flex: 2, child: AppText('Application Status', fontSize: 13)),
                            Expanded(
                              flex: 3,
                              child: AppText(' : Onboarded',
                                  fontSize: 13, color: AppColorConstant.appGreen, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Expanded(flex: 2, child: AppText('Store Status', fontSize: 13)),
                            Expanded(
                              flex: 3,
                              child: AppText(' : Inactive',
                                  fontSize: 13, color: AppColorConstant.appRed, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Expanded(flex: 2, child: AppText('Onboarded On', fontSize: 13)),
                            Expanded(flex: 3, child: AppText(' : 2023-08-21', fontSize: 13)),
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
                    margin: const EdgeInsets.only(bottom: 85),
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColorConstant.appWhite),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColorConstant.appRed,
                          border: Border.all(color: AppColorConstant.appGrey, width: 3)),
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
                    buildProfileDetails('Business', 'Retailer'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Store name', 'Suresh store'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Store number', '1231231231'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Owner', 'Suresh'),
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
                    buildProfileDetails('Account number', '1231231231'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Account name', 'Suresh'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('IFSC code', '1231231231'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Bank branch', '1231231231'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Bank name', '1231231231'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Google pay', 'Suresh'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Phone pay', '9784561236'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Paytm', '9784561236'),
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
                    buildProfileDetails('Mobile Number', '9876543233'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Email', 'grocerystore@gmail.com'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Application Started date', '04/02/1970'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Child 1 birth date', '04/02/1970'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Child 2 birth date', '04/02/1970'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Address',
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. '),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Deals in', 'Premium Products'),
                    buildProfileDetails('Popular in', 'High Quality Products'),
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
                    buildProfileDetails('GST', '123456789123'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Store License', 'JG 64767 5589799'),
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
                    buildProfileDetails('Opening time', '09:30'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Closing time', '09:30'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Delivery strength', '3'),
                    SizedBox(height: 16.px),
                    const AppText('Slots :', fontWeight: FontWeight.w500),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Forenoon', '09:30 AM - 09:30 PM'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Afternoon', '09:30 AM - 09:30 PM'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Late Afternoon', '09:30 AM - 09:30 PM'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Evening', '09:30 AM - 09:30 PM'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Morning', '09:30 AM - 09:30 PM'),
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Message to customer from retailer :',
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                    ),
                    AppText(
                      'Where Quality Matters',
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
