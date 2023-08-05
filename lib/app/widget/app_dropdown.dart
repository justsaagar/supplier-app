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
        AppText(headerTitle, fontSize: 14.px, fontWeight: FontWeight.w500, color: AppColorConstant.appBlack),
        SizedBox(height: 4.px),
        DropdownButtonHideUnderline(
          child: Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColorConstant.appGrey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(10.px),
              color: AppColorConstant.appWhite,
            ),
            child: DropdownButton2(
              buttonPadding: const EdgeInsets.all(0),
              isExpanded: true,
              hint: AppText(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                fontSize: 14.px,
                fontWeight: FontWeight.w400,
                color: AppColorConstant.lightGreyColor,
              ),
              style: TextStyle(
                fontSize: 14.px,
                fontWeight: FontWeight.w400,
              ),
              value: value,
              items: items,
              onChanged: onChanged,
              buttonHeight: 50.px,
              buttonDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10.px)),
              icon: const Icon(Icons.arrow_drop_down_rounded),
              itemHeight: 43,
              itemPadding: const EdgeInsets.symmetric(horizontal: 10),
              dropdownPadding: const EdgeInsets.symmetric(horizontal: 10),
              dropdownMaxHeight: 400,
              dropdownDecoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.px), color: AppColorConstant.appWhite),
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
