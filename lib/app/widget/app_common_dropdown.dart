import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supplier/app/widget/app_text.dart';
import 'package:supplier/constant/color_constant.dart';

class AppDropdownButton extends StatelessWidget {
  final dynamic value;
  final ValueChanged<dynamic>? onChanged;
  final List<DropdownMenuItem<dynamic>>? items;
  final String title;
  final String headerTitle;

  const AppDropdownButton(
      {super.key, this.value, this.onChanged, this.items, required this.title, required this.headerTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(headerTitle, fontSize: 16.px, fontWeight: FontWeight.w500, color: AppColorConstant.appWhite),
        DropdownButtonHideUnderline(
          child: Container(
            height: 52,
            padding: EdgeInsets.only(left: 18.px),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.px),
              color: AppColorConstant.lightGreyColor.withOpacity(0.19),
            ),
            child: DropdownButton2(
              buttonPadding: const EdgeInsets.symmetric(horizontal: 8),
              isExpanded: true,
              hint: AppText(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                fontSize: 14.px,
                fontWeight: FontWeight.w400,
                color: AppColorConstant.lightGreyColor,
              ),
              value: value,
              items: items,
              onChanged: onChanged,
              buttonHeight: 50.px,
              buttonDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10.px)),
              icon: const Icon(Icons.arrow_drop_down_rounded),
              itemHeight: 43,
              dropdownMaxHeight: 400,
              dropdownWidth: Device.width - 28.px,
              dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10.px), color: AppColorConstant.lightBlue),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(40),
              dropdownOverButton: false,
            ),
          ),
        )
      ],
    );
  }
}
