import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supplier/constant/color_constant.dart';

class AppShimmerEffect extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;

  const AppShimmerEffect(
      {Key? key, this.height, this.width, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorConstant.lightWhite,
      highlightColor: AppColorConstant.itemBgColor,
      child: Container(
        height: height ?? 30.px,
        width: width ?? 50.px,
        decoration: BoxDecoration(
          color: AppColorConstant.appCream,
          borderRadius: BorderRadius.circular(borderRadius ?? 4.px),
        ),
      ),
    );
  }
}
