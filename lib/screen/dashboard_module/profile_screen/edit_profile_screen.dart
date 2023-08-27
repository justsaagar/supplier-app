import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/app_text_form_field.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/controller/edit_profile_controller.dart';
import 'package:supplier/utils/utils.dart';

import '../../../utils/date_utils.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
      builder: (EditProfileController editProfileController) {
        return Scaffold(
          appBar: AppAppBar(title: AppStringConstants.storeName),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              await Get.bottomSheet(UploadImageEditView(isBack: true),
                                  useRootNavigator: true, isScrollControlled: true);
                            },
                            child: Stack(
                              alignment: Alignment.centerRight,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: AppImageAsset(image: "assets/icons/camera.svg", height: 35, width: 35),
                                  ),
                                ),
                                if (editProfileController.storeBackImage != null &&
                                    editProfileController.storeBackImage!.isNotEmpty)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: AppImageAsset(image: editProfileController.storeBackImage!, height: 130),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                      InkWell(
                        onTap: () => Get.bottomSheet(UploadImageEditView(isBack: false),
                            useRootNavigator: true, isScrollControlled: true),
                        child: Container(
                          height: 110,
                          width: 110,
                          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.all(2),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                            child: (editProfileController.storeFrontImage != null &&
                                    editProfileController.storeFrontImage!.isNotEmpty)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(500),
                                    child: AppImageAsset(
                                        image: editProfileController.storeFrontImage!, height: 100, width: 100),
                                  )
                                : const AppImageAsset(image: "assets/icons/camera.svg", height: 24, width: 32),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // const CommonText(content: "Business Type"),
                  // SizedBox(height: height * 0.01),
                  // Row(
                  //   children: [
                  //     InkWell(
                  //       onTap: () {
                  //         editProfileController.selectedBusinessType.value =
                  //             0;
                  //       },
                  //       child: Container(
                  //         height: 20,
                  //         width: 20,
                  //         decoration: BoxDecoration(
                  //           border:
                  //               Border.all(color: AppColors.semiGreyColor),
                  //           shape: BoxShape.circle,
                  //         ),
                  //         child: Obx(
                  //           () => editProfileController
                  //                       .selectedBusinessType.value ==
                  //                   0
                  //               ? Center(
                  //                   child: CircleAvatar(
                  //                     backgroundColor: AppColorConstant.appBlack,
                  //                     radius: 5,
                  //                   ),
                  //                 )
                  //               : const SizedBox(),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 8),
                  //     CommonText(
                  //         content: "Retailer",
                  //         textColor: AppColorConstant.appBlack),
                  //     SizedBox(width: width * 0.2),
                  //     InkWell(
                  //       onTap: () {
                  //         editProfileController.selectedBusinessType.value =
                  //             1;
                  //       },
                  //       child: Container(
                  //         height: 20,
                  //         width: 20,
                  //         decoration: BoxDecoration(
                  //           border:
                  //               Border.all(color: AppColors.semiGreyColor),
                  //           shape: BoxShape.circle,
                  //         ),
                  //         child: Obx(
                  //           () => editProfileController
                  //                       .selectedBusinessType.value ==
                  //                   1
                  //               ? Center(
                  //                   child: CircleAvatar(
                  //                     backgroundColor: AppColorConstant.appBlack,
                  //                     radius: 5,
                  //                   ),
                  //                 )
                  //               : const SizedBox(),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 8),
                  //     CommonText(
                  //         content: "Supplier",
                  //         textColor: AppColorConstant.appBlack),
                  //   ],
                  // ),
                  // SizedBox(height: 20),
                  // CommonText(
                  //   content: "Business",
                  //   textColor: AppColorConstant.appBlack,
                  //   boldNess: FontWeight.w600,
                  // ),
                  // SizedBox(height: height * 0.01),
                  // ButtonTheme(
                  //   alignedDropdown: true,
                  //   child: DropdownButtonFormField(
                  //     style: TextStyle(color: AppColorConstant.appBlack),
                  //     hint: CommonText(
                  //       content: editProfileController.selectBusiness,
                  //       textColor: AppColorConstant.appBlack,
                  //     ),
                  //     items: editProfileController.businessCategoryList
                  //         .map<DropdownMenuItem<String>>((value) {
                  //       return DropdownMenuItem<String>(
                  //         value: value["categoryName"],
                  //         child: CommonText(
                  //           content: value['categoryName'],
                  //           textColor: AppColorConstant.appBlack,
                  //         ),
                  //       );
                  //     }).toList(),
                  //     onChanged: (value) {
                  //       editProfileController.selectBusiness =
                  //           value.toString();
                  //       for (int i = 0;
                  //           i <
                  //               editProfileController
                  //                   .businessCategoryList.length;
                  //           i++) {
                  //         if (editProfileController.businessCategoryList[i]
                  //                 ['categoryName'] ==
                  //             value) {
                  //           editProfileController.selectBusinessId =
                  //               editProfileController
                  //                   .businessCategoryList[i]['categoryId'];
                  //           print(editProfileController.selectBusinessId);
                  //         }
                  //       }
                  //       print(value);
                  //     },
                  //     decoration: InputDecoration(
                  //       contentPadding: const EdgeInsets.symmetric(
                  //           vertical: 10, horizontal: 20),
                  //       border: OutlineInputBorder(
                  //         borderRadius:
                  //             const BorderRadius.all(Radius.circular(10)),
                  //         borderSide: BorderSide(
                  //           color: AppColors.semiGreyColor,
                  //           width: 1,
                  //         ),
                  //       ),
                  //       disabledBorder: OutlineInputBorder(
                  //         borderRadius:
                  //             const BorderRadius.all(Radius.circular(10)),
                  //         borderSide: BorderSide(
                  //           color: AppColors.semiGreyColor,
                  //           width: 1,
                  //         ),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius:
                  //             const BorderRadius.all(Radius.circular(10)),
                  //         borderSide: BorderSide(
                  //           color: AppColors.semiGreyColor,
                  //           width: 1,
                  //         ),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius:
                  //             const BorderRadius.all(Radius.circular(10)),
                  //         borderSide: BorderSide(
                  //           color: AppColors.semiGreyColor,
                  //           width: 1,
                  //         ),
                  //       ),
                  //       errorBorder: OutlineInputBorder(
                  //         borderRadius:
                  //             const BorderRadius.all(Radius.circular(10)),
                  //         borderSide: BorderSide(
                  //           color: AppColors.semiGreyColor,
                  //           width: 1,
                  //         ),
                  //       ),
                  //       hintText: "Select Business",
                  //       hintStyle:
                  //           GoogleFonts.poppins(color: AppColors.hintColor),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  CommonTextField(
                    content: "Enter Owner Name*",
                    hintText: "Enter Owner Name",
                    controller: editProfileController.ownerNameController,
                    contentColor: AppColorConstant.appBlack,
                  ),
                  const SizedBox(height: 20),
                  CommonTextField(
                    content: "Store Name*",
                    hintText: "Enter your Store Name",
                    controller: editProfileController.storeNameController,
                    contentColor: AppColorConstant.appBlack,
                  ),
                  const SizedBox(height: 20),

                  CommonTextField(
                    content: "Store Mobile Number*",
                    hintText: "Enter Store mobile number",
                    controller: editProfileController.storeNumberController,
                    contentColor: AppColorConstant.appBlack,
                  ),
                  const SizedBox(height: 20),
                  CommonTextField(
                    content: "Mobile Number*",
                    hintText: "Enter mobile number",
                    controller: editProfileController.phoneController,
                    contentColor: AppColorConstant.appBlack,
                  ),
                  const SizedBox(height: 20),
                  CommonTextField(
                    content: "Email*",
                    hintText: "Enter email",
                    controller: editProfileController.emailController,
                    contentColor: AppColorConstant.appBlack,
                  ),
                  const SizedBox(height: 20),
                  CommonTextField(
                    content: "Address*",
                    hintText: "Enter Address",
                    controller: editProfileController.addressController,
                    contentColor: AppColorConstant.appBlack,
                    enabled: true,
                    readOnly: true,
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  CommonTextField(
                    content: "Deals In",
                    hintText: "",
                    controller: editProfileController.dealsInController,
                    contentColor: AppColorConstant.appBlack,
                  ),
                  const SizedBox(height: 20),
                  CommonTextField(
                    content: "Popular In",
                    hintText: "",
                    controller: editProfileController.popularController,
                    contentColor: AppColorConstant.appBlack,
                  ),
                  const SizedBox(height: 20),
                  editProfileController.selectBusiness == "Medical"
                      ? CommonTextField(
                          controller: editProfileController.pharmaNameController,
                          content: "Registered Pharmacist Name*",
                          hintText: "Enter Pharmacist Name",
                          contentColor: AppColorConstant.appBlack,
                        )
                      : const SizedBox(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CommonTextField(
                          content: "GST",
                          hintText: "Enter GST number",
                          controller: editProfileController.gstController,
                          contentColor: AppColorConstant.appBlack,
                        ),
                      ),
                      const SizedBox(width: 20),
                      if ((editProfileController.profileData['applicationStatus'] ?? "") == 'Rejected') ...[
                        InkWell(
                          onTap: () async {
                            editProfileController.gstNumber != ""
                                ? editProfileController.gstNumber = ""
                                : Get.bottomSheet(
                                    UploadImageEditView(type: 'gst'),
                                    useRootNavigator: true,
                                    isScrollControlled: true,
                                  );

                            editProfileController.update();
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 46,
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                                decoration: BoxDecoration(
                                    color: editProfileController.gstNumber == ""
                                        ? AppColorConstant.appBlack
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      editProfileController.gstNumber == ""
                                          ? "assets/icons/share.png"
                                          : "assets/icons/done.png",
                                      height: 16,
                                      width: 16,
                                    ),
                                    if (editProfileController.gstNumber != "") const SizedBox(width: 5),
                                    if (editProfileController.gstNumber != "")
                                      const AppImageAsset(
                                        image: "assets/icons/delete_icon.png",
                                        // color: Colors.white,
                                        height: 16,
                                        width: 16,
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if ((editProfileController.profileData['applicationStatus'] ?? "") != 'Rejected')
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: const Icon(Icons.remove_red_eye, color: AppColorConstant.appBlack),
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: CommonTextField(
                          content: "Store License",
                          hintText: "Enter License number",
                          controller: editProfileController.storeLicenseController,
                          contentColor: AppColorConstant.appBlack,
                        ),
                      ),
                      const SizedBox(width: 20),
                      if ((editProfileController.profileData['applicationStatus'] ?? "") == 'Rejected') ...[
                        InkWell(
                          onTap: () async {
                            editProfileController.storeLicense != ""
                                ? editProfileController.storeLicense = ""
                                : Get.bottomSheet(
                                    UploadImageEditView(type: 'store'),
                                    useRootNavigator: true,
                                    isScrollControlled: true,
                                  );

                            editProfileController.update();
                          },
                          child: Container(
                            height: 46,
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                            decoration: BoxDecoration(
                                color: editProfileController.storeLicense == ""
                                    ? AppColorConstant.appBlack
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Image.asset(
                                  editProfileController.storeLicense == ""
                                      ? "assets/icons/share.png"
                                      : "assets/icons/done.png",
                                  height: 16,
                                  width: 16,
                                ),
                                if (editProfileController.storeLicense != "") const SizedBox(width: 6),
                                if (editProfileController.storeLicense != "")
                                  const AppImageAsset(
                                    image: "assets/icons/delete_icon.png",
                                    height: 16,
                                    width: 16,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      if ((editProfileController.profileData['applicationStatus'] ?? "") != 'Rejected')
                        Container(
                          padding: const EdgeInsets.only(top: 0),
                          child: const Icon(Icons.remove_red_eye, color: AppColorConstant.appBlack),
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  editProfileController.selectBusiness.toLowerCase().contains('medi')
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: CommonTextField(
                                content: "Drug License",
                                hintText: "Enter License number",
                                controller: editProfileController.drugLicenseController,
                                contentColor: AppColorConstant.appBlack,
                              ),
                            ),
                            const SizedBox(width: 10),
                            if ((editProfileController.profileData['applicationStatus'] ?? "") == 'Rejected')
                              InkWell(
                                onTap: () async {
                                  editProfileController.storeDrugLicense != ""
                                      ? editProfileController.storeDrugLicense = ""
                                      : Get.bottomSheet(
                                          UploadImageEditView(type: 'drug'),
                                          useRootNavigator: true,
                                          isScrollControlled: true,
                                        );
                                  editProfileController.update();
                                },
                                child: Container(
                                  height: 46,
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: editProfileController.storeDrugLicense == ""
                                        ? AppColorConstant.appBlack
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        editProfileController.storeDrugLicense == ""
                                            ? "assets/icons/share.png"
                                            : "assets/icons/done.png",
                                        height: 16,
                                        width: 16,
                                      ),
                                      if (editProfileController.storeDrugLicense != "") const SizedBox(width: 6),
                                      if (editProfileController.storeDrugLicense != "")
                                        const AppImageAsset(
                                          image: "assets/icons/delete_icon.png",
                                          height: 16,
                                          width: 16,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            if ((editProfileController.profileData['applicationStatus'] ?? "") != 'Rejected')
                              Container(
                                padding: const EdgeInsets.only(top: 20),
                                child: const Icon(Icons.remove_red_eye, color: AppColorConstant.appYellow),
                              ),
                          ],
                        )
                      : const SizedBox(),
                  const SizedBox(height: 20),
                  const AppText(
                    "Slots",
                    color: AppColorConstant.appBlack,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          editProfileController.deliverySlotsList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: AppText(
                              editProfileController.deliverySlotsList[index].slotName.toString(),
                              color: AppColorConstant.appBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          editProfileController.deliverySlotsList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: AppText(
                              ' : ${editProfileController.deliverySlotsList[index].startTime} - ${editProfileController.deliverySlotsList[index].endTime}',
                              color: AppColorConstant.appBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          editProfileController.deliverySlotsList.length,
                          (index) => InkWell(
                            onTap: () {
                              editProfileController.deliverySlotsList[index].isChecked =
                                  !editProfileController.deliverySlotsList[index].isChecked;
                              editProfileController.update();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: editProfileController.deliverySlotsList[index].isChecked
                                    ? AppColorConstant.appBlack
                                    : AppColorConstant.appWhite,
                                border: Border.all(
                                    color: editProfileController.deliverySlotsList[index].isChecked
                                        ? AppColorConstant.appBlack
                                        : AppColorConstant.appBluest,
                                    width: 1),
                              ),
                              child: const Icon(Icons.done, color: AppColorConstant.appWhite),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CommonTextField(
                    controller: editProfileController.documentController,
                    content: "Document Address*",
                    hintText: "Enter Address",
                    contentColor: AppColorConstant.appBluest,
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        confirmText: 'Confirm',
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData(
                              dialogBackgroundColor: AppColorConstant.appBlack,
                              colorScheme: const ColorScheme.light(
                                primary: AppColorConstant.appBlack,
                                onSurface: AppColorConstant.appBlack,
                              ),
                              // fontFamily: AppAssets.defaultFont,
                              dialogTheme: DialogTheme(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                elevation: 2,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      editProfileController.storeOpeningController.text = time!.format(Get.context!);
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                          child: AppText(
                            'Store Opening Time*',
                            color: AppColorConstant.appBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: IgnorePointer(
                            ignoring: true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColorConstant.appBlack),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                controller: editProfileController.storeOpeningController,
                                readOnly: true,
                                style: const TextStyle(fontSize: 13, color: AppColorConstant.appBlack),
                                decoration: const InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        confirmText: 'Confirm',
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData(
                              dialogBackgroundColor: AppColorConstant.appWhite,
                              colorScheme: const ColorScheme.light(
                                primary: AppColorConstant.appBlack,
                                onSurface: AppColorConstant.appBlack,
                              ),
                              dialogTheme: DialogTheme(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                elevation: 2,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      editProfileController.storeClosingController.text = time!.format(Get.context!);
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                          child:
                              AppHeaderText(headerText: 'Store Closing Time*', headerColor: AppColorConstant.appBlack),
                        ),
                        Expanded(
                          child: IgnorePointer(
                            ignoring: true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColorConstant.appBlack),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                controller: editProfileController.storeClosingController,
                                readOnly: true,
                                style: const TextStyle(
                                  color: AppColorConstant.appBlack,
                                  fontSize: 13,
                                ),
                                decoration: const InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        firstDate: DateTime(DateTime.now().year - 100, 1),
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        helpText: 'Retailer Birthdate',
                        confirmText: 'okay',
                        cancelText: 'cancel',
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData(
                              dialogBackgroundColor: AppColorConstant.appWhite,
                              colorScheme: const ColorScheme.light(
                                primary: AppColorConstant.appBlack,
                                onSurface: AppColorConstant.appBlack,
                              ),
                              dialogTheme: DialogTheme(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                elevation: 2,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (picked != null) {
                        editProfileController.retailerBirthdateController.text =
                            DateTimeUtils.getFormattedDateTime(picked);
                        editProfileController.update();
                      }
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child:
                              AppHeaderText(headerText: 'Retailer Birthdate :', headerColor: AppColorConstant.appBlack),
                        ),
                        Expanded(
                          child: IgnorePointer(
                            ignoring: true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColorConstant.appBlack),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextFormField(
                                controller: editProfileController.retailerBirthdateController,
                                readOnly: true,
                                style: const TextStyle(fontSize: 13, color: AppColorConstant.appBlack),
                                decoration: const InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        firstDate: DateTime(DateTime.now().year - 100, 1),
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        helpText: 'Wedding Aniversary Date',
                        confirmText: 'okay',
                        cancelText: 'cancel',
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData(
                              dialogBackgroundColor: AppColorConstant.appWhite,
                              colorScheme: const ColorScheme.light(
                                primary: AppColorConstant.appBlack,
                                onSurface: AppColorConstant.appBlack,
                              ),
                              dialogTheme: DialogTheme(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                elevation: 2,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (picked != null) {
                        editProfileController.weddingAniversaryController.text =
                            DateTimeUtils.getFormattedDateTime(picked);
                        editProfileController.update();
                      }
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                          child: AppHeaderText(
                              headerText: 'Wedding Aniversary Date :', headerColor: AppColorConstant.appBlack),
                        ),
                        Expanded(
                          child: IgnorePointer(
                            ignoring: true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColorConstant.appBlack),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextFormField(
                                controller: editProfileController.weddingAniversaryController,
                                readOnly: true,
                                style: const TextStyle(fontSize: 13, color: AppColorConstant.appBlack),
                                decoration: const InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        firstDate: DateTime(DateTime.now().year - 100, 1),
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        helpText: 'Child 1 Birth Date',
                        confirmText: 'okay',
                        cancelText: 'cancel',
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData(
                              dialogBackgroundColor: AppColorConstant.appWhite,
                              colorScheme: const ColorScheme.light(
                                primary: AppColorConstant.appBlack,
                                onSurface: AppColorConstant.appBlack,
                              ),
                              dialogTheme: DialogTheme(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                elevation: 2,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (picked != null) {
                        editProfileController.childOneController.text = DateTimeUtils.getFormattedDateTime(picked);
                        editProfileController.update();
                      }
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                          child:
                              AppHeaderText(headerText: 'Child 1 Birth Date :', headerColor: AppColorConstant.appBlack),
                        ),
                        Expanded(
                          child: IgnorePointer(
                            ignoring: true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColorConstant.appBlack),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                controller: editProfileController.childOneController,
                                readOnly: true,
                                style: const TextStyle(fontSize: 13, color: AppColorConstant.appBlack),
                                decoration: const InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        firstDate: DateTime(DateTime.now().year - 100, 1),
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        helpText: 'Child 2 Birth Date',
                        confirmText: 'okay',
                        cancelText: 'cancel',
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData(
                              dialogBackgroundColor: AppColorConstant.appWhite,
                              colorScheme: const ColorScheme.light(
                                primary: AppColorConstant.appBlack,
                                onSurface: AppColorConstant.appBlack,
                              ),
                              dialogTheme: DialogTheme(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                elevation: 2,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (picked != null) {
                        editProfileController.childTwoController.text = DateTimeUtils.getFormattedDateTime(picked);
                        editProfileController.update();
                      }
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                          child:
                              AppHeaderText(headerText: 'Child 2 Birth Date :', headerColor: AppColorConstant.appBlack),
                        ),
                        Expanded(
                          child: IgnorePointer(
                            ignoring: true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColorConstant.appBlack),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                controller: editProfileController.childTwoController,
                                readOnly: true,
                                style: const TextStyle(color: AppColorConstant.appBlack, fontSize: 13),
                                decoration: const InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                        child: AppHeaderText(headerText: 'Delivery Strength', headerColor: AppColorConstant.appBlack),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColorConstant.appBlack),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: editProfileController.deliveryStrengthController,
                            style: const TextStyle(color: AppColorConstant.appBlack),
                            decoration: const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const AppHeaderText(
                      headerText: 'Message From Retailer To Customer', headerColor: AppColorConstant.appBlack),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColorConstant.appBlack),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: editProfileController.messageController,
                      decoration: const InputDecoration(border: InputBorder.none),
                      maxLines: 5,
                      style: const TextStyle(color: AppColorConstant.appBlack),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.black),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: AppText(
                              "Cancel",
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () => editProfileController.editProfileDataApi(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: editProfileController.isLoading.value
                                  ? const CupertinoActivityIndicator(
                                      color: Colors.white,
                                      radius: 10,
                                    )
                                  : const AppText(
                                      "Save",
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // body: ListView(
          //   padding: EdgeInsets.all(24.px),
          //   children: [
          //     AppTextFormField(
          //       controller: editProfileController.ownerNameController,
          //       hintText: 'Enter Owner Name',
          //       headerTitle: 'Owner Name',
          //     ),
          //     SizedBox(height: 16.px),
          //     AppTextFormField(
          //       controller: editProfileController.storeNameController,
          //       hintText: 'Enter your Store Name',
          //       headerTitle: 'Store Name',
          //     ),
          //     SizedBox(height: 16.px),
          //     AppTextFormField(
          //       controller: editProfileController.mobileNumberController,
          //       headerTitle: 'Mobile number',
          //       hintText: 'Enter mobile number',
          //       keyboardType: const TextInputType.numberWithOptions(),
          //       prefixIcon: IntlPhoneField(
          //         flagsButtonMargin: EdgeInsets.zero,
          //         onCountryChanged: (Country value) => editProfileController.onCountryChange(value),
          //         initialCountryCode: 'IN',
          //         showDropdownIcon: false,
          //         showCountryFlag: false,
          //         validator: (p0) => null,
          //         readOnly: true,
          //         style: TextStyle(
          //           fontFamily: AppAsset.defaultFont,
          //           fontSize: 14.px,
          //           fontWeight: FontWeight.w600,
          //           color: AppColorConstant.appRed,
          //         ),
          //         decoration: InputDecoration(
          //           border: InputBorder.none,
          //           enabledBorder: InputBorder.none,
          //           prefixIcon: const SizedBox(),
          //           prefixStyle: TextStyle(
          //             fontFamily: AppAsset.defaultFont,
          //             fontSize: 14.px,
          //             fontWeight: FontWeight.w600,
          //             color: AppColorConstant.appRed,
          //           ),
          //           labelStyle: TextStyle(
          //             fontFamily: AppAsset.defaultFont,
          //             fontSize: 14.px,
          //             fontWeight: FontWeight.w600,
          //             color: AppColorConstant.appWhite,
          //           ),
          //           suffixIconConstraints: BoxConstraints(minHeight: 2.px, minWidth: 4.px),
          //           suffixIcon: const SizedBox(),
          //           contentPadding: EdgeInsets.zero,
          //           counterText: '',
          //         ),
          //       ),
          //     ),
          //     SizedBox(height: 16.px),
          //     AppTextFormField(
          //       controller: editProfileController.emailAddressController,
          //       hintText: 'Enter email',
          //       headerTitle: 'Email',
          //     ),
          //     SizedBox(height: 16.px),
          //     AppTextFormField(
          //       controller: editProfileController.weddingAnniversaryController,
          //       headerTitle: 'Wedding anniversary date',
          //       hintText: 'DD/MM/YYYY',
          //       suffixIcon: const Icon(Icons.calendar_today, color: AppColorConstant.appGrey),
          //     ),
          //     SizedBox(height: 16.px),
          //     AppTextFormField(
          //       controller: editProfileController.childOneController,
          //       headerTitle: 'Child 1 birth date',
          //       hintText: 'DD/MM/YYYY',
          //       suffixIcon: const Icon(Icons.calendar_today, color: AppColorConstant.appGrey),
          //     ),
          //     SizedBox(height: 16.px),
          //     AppTextFormField(
          //       controller: editProfileController.childTwoController,
          //       headerTitle: 'Child 2 birth date',
          //       hintText: 'DD/MM/YYYY',
          //       suffixIcon: const Icon(Icons.calendar_today, color: AppColorConstant.appGrey),
          //     ),
          //     SizedBox(height: 16.px),
          //     AppTextFormField(
          //       controller: editProfileController.addressController,
          //       headerTitle: 'Address',
          //       hintText: 'Enter address',
          //     ),
          //     SizedBox(height: 16.px),
          //     AppTextFormField(
          //       controller: editProfileController.areaController,
          //       headerTitle: 'Area',
          //       hintText: 'Enter area',
          //     ),
          //     SizedBox(height: 16.px),
          //     AppTextFormField(
          //       controller: editProfileController.dealsInController,
          //       headerTitle: 'Deals in',
          //       hintText: '',
          //     ),
          //     SizedBox(height: 16.px),
          //     AppTextFormField(
          //       controller: editProfileController.popularInController,
          //       headerTitle: 'Popular in',
          //       hintText: '',
          //     ),
          //     SizedBox(height: 16.px),
          //     Row(
          //       children: [
          //         Expanded(
          //           child: AppTextFormField(
          //             controller: editProfileController.gstNumberController,
          //             headerTitle: 'GST',
          //             hintText: 'Enter GST number',
          //             readOnly: true,
          //           ),
          //         ),
          //         Container(
          //           padding: EdgeInsets.only(top: 30.px, left: 12.px),
          //           child: AppImageAsset(image: AppAsset.approveIcon, height: 22.px, width: 22.px),
          //         ),
          //         SizedBox(width: 4.px),
          //         Container(
          //           padding: EdgeInsets.only(top: 30.px),
          //           child: AppImageAsset(image: AppAsset.deleteIcon, height: 22.px, width: 22.px),
          //         ),
          //       ],
          //     ),
          //     SizedBox(height: 16.px),
          //     Row(
          //       children: [
          //         Expanded(
          //           child: AppTextFormField(
          //             controller: editProfileController.storeLicenseNumberController,
          //             headerTitle: 'Store License',
          //             hintText: 'Enter License number',
          //             readOnly: true,
          //           ),
          //         ),
          //         Container(
          //           padding: EdgeInsets.only(top: 30.px, left: 12.px),
          //           child: AppImageAsset(image: AppAsset.approveIcon, height: 22.px, width: 22.px),
          //         ),
          //         SizedBox(width: 4.px),
          //         Container(
          //           padding: EdgeInsets.only(top: 30.px),
          //           child: AppImageAsset(image: AppAsset.deleteIcon, height: 22.px, width: 22.px),
          //         ),
          //       ],
          //     ),
          //     SizedBox(height: 16.px),
          //     Row(
          //       children: [
          //         Expanded(
          //           child: AppTextFormField(
          //             controller: editProfileController.drugNumberController,
          //             headerTitle: 'Drug License',
          //             hintText: 'Enter License number',
          //             readOnly: true,
          //           ),
          //         ),
          //         Container(
          //           padding: EdgeInsets.only(top: 30.px, left: 12.px),
          //           child: AppImageAsset(image: AppAsset.approveIcon, height: 22.px, width: 22.px),
          //         ),
          //         SizedBox(width: 4.px),
          //         Container(
          //           padding: EdgeInsets.only(top: 30.px),
          //           child: AppImageAsset(image: AppAsset.deleteIcon, height: 22.px, width: 22.px),
          //         ),
          //       ],
          //     ),
          //     SizedBox(height: 16.px),
          //     Row(
          //       children: [
          //         Expanded(
          //           child: Container(
          //             height: 46.px,
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //               border: Border.all(color: AppColorConstant.appBluest),
          //               borderRadius: BorderRadius.circular(6.px),
          //             ),
          //             child: const AppText('Cancel', color: AppColorConstant.appBluest, fontWeight: FontWeight.w600),
          //           ),
          //         ),
          //         SizedBox(width: 16.px),
          //         Expanded(
          //           child: Container(
          //             height: 46.px,
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //               color: AppColorConstant.appBluest,
          //               borderRadius: BorderRadius.circular(6.px),
          //             ),
          //             child: const AppText('Save', color: AppColorConstant.appWhite, fontWeight: FontWeight.w600),
          //           ),
          //         ),
          //       ],
          //     )
          //   ],
          // ),
        );
      },
    );
  }
}

class UploadImageEditView extends StatelessWidget {
  final dashboardController = Get.find<EditProfileController>();
  final bool isBack;
  final String? type;

  UploadImageEditView({Key? key, this.isBack = false, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColorConstant.appWhite,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 22),
      child: ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 22, bottom: 10),
            child: AppText('Select store cover image',
                fontSize: 16, color: AppColorConstant.appBlack, fontWeight: FontWeight.w600),
          ),
          const Divider(color: AppColorConstant.appBlack, thickness: 1, height: 0),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => dashboardController.selectBannerImage(ImageSource.camera, isBack, type),
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: AppColorConstant.appWhite,
                      borderRadius: BorderRadius.circular(8),
                      // boxShadow: AppColors.semiGreyColor,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/camera.svg",
                          height: 16,
                          width: 16,
                        ),
                        const SizedBox(width: 20),
                        const AppText(
                          'camera',
                          fontSize: 16,
                          color: AppColorConstant.appBlack,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () => dashboardController.selectBannerImage(ImageSource.gallery, isBack, type),
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: AppColorConstant.appWhite,
                      borderRadius: BorderRadius.circular(8),
                      // boxShadow: AppColors.appBoxShadow,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/gallery.png",
                          height: 16,
                          width: 16,
                        ),
                        const SizedBox(width: 20),
                        const AppText(
                          'gallery',
                          fontSize: 16,
                          color: AppColorConstant.appBlack,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
