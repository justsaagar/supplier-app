import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_app_bar.dart';
import 'package:supplier/app/widget/app_image_assets.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/app/widget/app_text_form_field.dart';
import 'package:supplier/constant/color_constant.dart';
import 'package:supplier/constant/string_constant.dart';
import 'package:supplier/controller/edit_profile_controller.dart';
import 'package:supplier/utils/date_utils.dart';
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
          appBar: AppAppBar(title: AppStringConstants.storeName),
          floatingActionButton: FloatingActionButton(
            onPressed: () => editProfileController.getStoreProfile(),
          ),
          body: ListView(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          await Get.bottomSheet(
                            UploadImageEditView(isBack: true),
                            useRootNavigator: true,
                            isScrollControlled: true,
                          );
                        },
                        child: Stack(
                          alignment: Alignment.centerRight,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 130.px,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.px),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 50),
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: AppImageAsset(
                                    image: "assets/icons/camera.svg",
                                    height: 35,
                                    width: 35),
                              ),
                            ),
                            if (editProfileController
                                    .storeBackImage.isNotEmpty)
                              SizedBox(
                                height: 130.px,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.px),
                                  child: AppImageAsset(
                                    image:
                                        editProfileController.storeBackImage,
                                    fit: BoxFit.cover,
                                    isFile: !editProfileController
                                        .storeBackImage.contains('http'),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                  InkWell(
                      onTap: () => Get.bottomSheet(
                          UploadImageEditView(isBack: false),
                          useRootNavigator: true,
                          isScrollControlled: true),
                      child: Container(
                        height: 110.px,
                        width: 110.px,
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColorConstant.appWhite),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColorConstant.appGrey, width: 3)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: (editProfileController
                                        .storeFrontImage.isNotEmpty)
                                ? AppImageAsset(
                                    image:
                                        editProfileController.storeFrontImage,
                                    fit: BoxFit.cover,
                                    isFile: !editProfileController
                                        .storeFrontImage.contains('http'),
                                  )
                                : Center(
                                    child: AppImageAsset(
                                        image: "assets/icons/camera.svg",
                                        height: 35.px,
                                        width: 35.px)),
                          ),
                        ),
                      )),
                ],
              ),
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
                controller: editProfileController.mobileNumberController,
                contentColor: AppColorConstant.appBlack,
              ),
              const SizedBox(height: 20),
              CommonTextField(
                content: "Email*",
                hintText: "Enter email",
                controller: editProfileController.emailAddressController,
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
                controller: editProfileController.popularInController,
                contentColor: AppColorConstant.appBlack,
              ),
              const SizedBox(height: 20),
              if (editProfileController.storeProfileModel!.storeCategory!.toLowerCase().contains('med')) ...[
                CommonTextField(
                  controller: editProfileController.regPharmaNameController,
                  content: "Registered Pharmacist Name*",
                  hintText: "Enter Pharmacist Name",
                  contentColor: AppColorConstant.appBlack,
                ),
                const SizedBox(height: 20),
              ],
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CommonTextField(
                      content: "GST",
                      hintText: "Enter GST number",
                      controller: editProfileController.gstNumberController,
                      contentColor: AppColorConstant.appBlack,
                    ),
                  ),
                  const SizedBox(width: 20),
                  if ((editProfileController.storeProfileModel?.applicationStatus ?? "") == 'Rejected') ...[
                    InkWell(
                      onTap: () async {
                        editProfileController.gstDocument.isNotEmpty
                            ? editProfileController.gstDocument
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 12),
                            decoration: BoxDecoration(
                                color: editProfileController.gstDocument == ""
                                    ? AppColorConstant.appBlack
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Image.asset(
                                  editProfileController.gstDocument.isEmpty
                                      ? "assets/icons/share.png"
                                      : "assets/icons/done.png",
                                  height: 16,
                                  width: 16,
                                ),
                                if (editProfileController.gstDocument.isNotEmpty)
                                  const SizedBox(width: 5),
                                if (editProfileController.gstDocument.isNotEmpty)
                                  const AppImageAsset(
                                    image: "assets/icons/delete_icon.png",
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
                  if ((editProfileController.storeProfileModel?.applicationStatus ?? "") != 'Rejected')
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
                      controller: editProfileController.storeLicenseNumberController,
                      contentColor: AppColorConstant.appBlack,
                    ),
                  ),
                  const SizedBox(width: 20),
                  if ((editProfileController.storeProfileModel?.applicationStatus ??
                          "") ==
                      'Rejected') ...[
                    InkWell(
                      onTap: () async {
                        editProfileController.storeLicenseDocument.isNotEmpty
                            ? editProfileController.storeLicenseDocument
                            : Get.bottomSheet(
                                UploadImageEditView(type: 'store'),
                                useRootNavigator: true,
                                isScrollControlled: true,
                              );

                        editProfileController.update();
                      },
                      child: Container(
                        height: 46,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 12),
                        decoration: BoxDecoration(
                            color: editProfileController.storeLicenseDocument.isEmpty
                                ? AppColorConstant.appBlack
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Image.asset(
                              editProfileController.storeLicenseDocument.isEmpty
                                  ? "assets/icons/share.png"
                                  : "assets/icons/done.png",
                              height: 16,
                              width: 16,
                            ),
                            if (editProfileController.storeLicenseDocument.isNotEmpty)
                              const SizedBox(width: 6),
                            if (editProfileController.storeLicenseDocument.isNotEmpty)
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
                  if ((editProfileController.storeProfileModel?.applicationStatus ?? "") != 'Rejected')
                    Container(
                      padding: const EdgeInsets.only(top: 0),
                      child: const Icon(Icons.remove_red_eye, color: AppColorConstant.appBlack),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              editProfileController.storeProfileModel!.storeCategory!.toLowerCase().contains('med')
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: CommonTextField(
                            content: "Drug License",
                            hintText: "Enter License number",
                            controller: editProfileController.drugNumberController,
                            contentColor: AppColorConstant.appBlack,
                          ),
                        ),
                        const SizedBox(width: 10),
                        if ((editProfileController.storeProfileModel?.applicationStatus ?? "") == 'Rejected')
                          InkWell(
                            onTap: () async {
                              editProfileController.drugLicenceDocument.isNotEmpty
                                  ? editProfileController.drugLicenceDocument
                                  : Get.bottomSheet(
                                      UploadImageEditView(type: 'drug'),
                                      useRootNavigator: true,
                                      isScrollControlled: true,
                                    );
                              editProfileController.update();
                            },
                            child: Container(
                              height: 46,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 12),
                              decoration: BoxDecoration(
                                color:
                                    editProfileController.drugLicenceDocument.isEmpty
                                        ? AppColorConstant.appBlack
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    editProfileController.drugLicenceDocument.isEmpty
                                        ? "assets/icons/share.png"
                                        : "assets/icons/done.png",
                                    height: 16,
                                    width: 16,
                                  ),
                                  if (editProfileController.drugLicenceDocument.isNotEmpty)
                                    const SizedBox(width: 6),
                                  if (editProfileController.drugLicenceDocument.isNotEmpty)
                                    const AppImageAsset(
                                      image: "assets/icons/delete_icon.png",
                                      height: 16,
                                      width: 16,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        if ((editProfileController.storeProfileModel?.applicationStatus ?? "") != 'Rejected')
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: const Icon(Icons.remove_red_eye,
                                color: AppColorConstant.appYellow),
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
                          editProfileController
                              .deliverySlotsList[index].slotName
                              .toString(),
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
                          editProfileController
                                  .deliverySlotsList[index].isChecked =
                              !editProfileController
                                  .deliverySlotsList[index].isChecked;
                          editProfileController.update();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: editProfileController
                                    .deliverySlotsList[index].isChecked
                                ? AppColorConstant.appBlack
                                : AppColorConstant.appWhite,
                            border: Border.all(
                                color: editProfileController
                                        .deliverySlotsList[index].isChecked
                                    ? AppColorConstant.appBlack
                                    : AppColorConstant.appBluest,
                                width: 1),
                          ),
                          child: const Icon(Icons.done,
                              color: AppColorConstant.appWhite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CommonTextField(
                controller: editProfileController.documentAddressController,
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
                    SizedBox(
                      width: Device.width / 2,
                      child: const AppText(
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
                            border:
                                Border.all(color: AppColorConstant.appBlack),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller:
                                editProfileController.storeOpeningController,
                            readOnly: true,
                            style: const TextStyle(
                                fontSize: 13, color: AppColorConstant.appBlack),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
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
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 2,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  editProfileController.storeClosingController.text =
                      time!.format(Get.context!);
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: Device.width / 2,
                      child: const AppHeaderText(
                        headerText: 'Store Closing Time*',
                        headerColor: AppColorConstant.appBlack,
                      ),
                    ),
                    Expanded(
                      child: IgnorePointer(
                        ignoring: true,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColorConstant.appBlack),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller:
                                editProfileController.storeClosingController,
                            readOnly: true,
                            style: const TextStyle(
                              color: AppColorConstant.appBlack,
                              fontSize: 13,
                            ),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
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
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 2,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (picked != null) {
                    editProfileController.birthDateController.text =
                        DateTimeUtils.getFormattedDateTime(picked);
                    editProfileController.update();
                  }
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: Device.width / 2,
                      child: AppHeaderText(
                          headerText: 'Retailer Birthdate :',
                          headerColor: AppColorConstant.appBlack),
                    ),
                    Expanded(
                      child: IgnorePointer(
                        ignoring: true,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColorConstant.appBlack),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller: editProfileController
                                .birthDateController,
                            readOnly: true,
                            style: const TextStyle(
                                fontSize: 13, color: AppColorConstant.appBlack),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
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
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 2,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (picked != null) {
                    editProfileController.weddingAnniversaryController.text =
                        DateTimeUtils.getFormattedDateTime(picked);
                    editProfileController.update();
                  }
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: Device.width / 2,
                      child: const AppHeaderText(
                          headerText: 'Wedding Aniversary Date :',
                          headerColor: AppColorConstant.appBlack),
                    ),
                    Expanded(
                      child: IgnorePointer(
                        ignoring: true,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColorConstant.appBlack),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller: editProfileController
                                .weddingAnniversaryController,
                            readOnly: true,
                            style: const TextStyle(
                                fontSize: 13, color: AppColorConstant.appBlack),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
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
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 2,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (picked != null) {
                    editProfileController.childOneController.text =
                        DateTimeUtils.getFormattedDateTime(picked);
                    editProfileController.update();
                  }
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: Device.width / 2,
                      child: AppHeaderText(
                          headerText: 'Child 1 Birth Date :',
                          headerColor: AppColorConstant.appBlack),
                    ),
                    Expanded(
                      child: IgnorePointer(
                        ignoring: true,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColorConstant.appBlack),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller:
                                editProfileController.childOneController,
                            readOnly: true,
                            style: const TextStyle(
                                fontSize: 13, color: AppColorConstant.appBlack),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
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
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 2,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (picked != null) {
                    editProfileController.childTwoController.text =
                        DateTimeUtils.getFormattedDateTime(picked);
                    editProfileController.update();
                  }
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: Device.width / 2,
                      child: AppHeaderText(
                          headerText: 'Child 2 Birth Date :',
                          headerColor: AppColorConstant.appBlack),
                    ),
                    Expanded(
                      child: IgnorePointer(
                        ignoring: true,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColorConstant.appBlack),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller:
                                editProfileController.childTwoController,
                            readOnly: true,
                            style: const TextStyle(
                                color: AppColorConstant.appBlack, fontSize: 13),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
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
                  SizedBox(
                    width:Device.width / 2,
                    child: AppHeaderText(
                        headerText: 'Delivery Strength',
                        headerColor: AppColorConstant.appBlack),
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
                        controller:
                            editProfileController.deliveryStrengthController,
                        style:
                            const TextStyle(color: AppColorConstant.appBlack),
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const AppHeaderText(
                  headerText: 'Message From Retailer To Customer',
                  headerColor: AppColorConstant.appBlack),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColorConstant.appBlack),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: editProfileController.messageToCustomerController,
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
                        child: editProfileController.isLoading
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
        );
      },
    );
  }
}

class UploadImageEditView extends StatelessWidget {
  final dashboardController = Get.find<EditProfileController>();
  final bool isBack;
  final String? type;

  UploadImageEditView({Key? key, this.isBack = false, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColorConstant.appWhite,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 22),
      child: ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 22, bottom: 10),
            child: AppText('Select store cover image',
                fontSize: 16,
                color: AppColorConstant.appBlack,
                fontWeight: FontWeight.w600),
          ),
          const Divider(
              color: AppColorConstant.appBlack, thickness: 1, height: 0),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => dashboardController.selectBannerImage(
                      ImageSource.camera, isBack, type),
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
                  onTap: () => dashboardController.selectBannerImage(
                      ImageSource.gallery, isBack, type),
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
