import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/routes/route_helper.dart';
import 'package:supplier/utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
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
                      AppText(
                        '  Edit Profile',
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
                padding: EdgeInsets.symmetric(vertical: 16.px, horizontal: 12.px),
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
                    buildProfileDetails('Business type', 'Retailer'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Business', 'Grocery store'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Store name', 'Suresh store'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Store number', '1231231231'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Store number', '1231231231'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Owner', 'Suresh'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Registered Pharmacist', 'Rajendra'),
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
                    buildProfileDetails('Mobile Number', '9876543233'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Email', 'grocerystore@gmail.com'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Wedding anniversary date', '04/02/1970\n04/02/1970'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Child 1 birth date', '04/02/1970'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Child 2 birth date', '04/02/1970'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Address',
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. '),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Area', 'Sureshish'),
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
                    buildProfileDetails('Deals in', 'Groceries, Essentials'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Popular in', 'FMCG Products'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('GST', '24GDSHDIS3HN5'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Store License', 'JG 64767 5589799'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Drug License', 'DRG 64767 5589799'),
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
                    const AppText('Store Timing info',fontWeight: FontWeight.w600),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Store opening time', '9 am'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Store closing time', '9 pm'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Delivery strength', '3'),
                    SizedBox(height: 16.px),
                    buildProfileDetails('Slot', 'Morning slot :  9am - 12pm\nAfternoon slot :  12pm - 5pm\nEvening slot :  5pm - 9pm'),
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
