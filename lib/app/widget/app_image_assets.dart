// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supplier/app/widget/shimmer_class.dart';

class AppImageAsset extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;

  const AppImageAsset({Key? key, required this.image, this.fit, this.height, this.width, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return image.contains('http')
        ? CachedNetworkImage(
            imageUrl: image,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            placeholder: (context, url) => AppShimmerEffect(
              height: height ?? double.maxFinite,
              width: width ?? double.maxFinite,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
          )
        : image.split('.').last != 'svg'
            ? Image.asset(image, fit: fit, height: height, width: width, color: color)
            : SvgPicture.asset(image, height: height, width: width, color: color);
  }
}
