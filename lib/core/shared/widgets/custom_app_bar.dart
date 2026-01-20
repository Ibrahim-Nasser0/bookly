import 'package:bookly/core/constant/app_assets.dart';
import 'package:bookly/core/constant/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AppAssets.logo, height: AppSizes.logoHeight.h),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, size: AppSizes.iconSize.h),
        ),
      ],
    );
  }
}
