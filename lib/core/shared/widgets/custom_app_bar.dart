import 'package:bookly/core/constant/app_assets.dart';
import 'package:bookly/core/constant/app_sizes.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.w),
      child: Row(
        children: [
          Image.asset(AppAssets.logo, height: AppSizes.logoHeight.h),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.searchView);
            },
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: AppSizes.largIconSize.h,
            ),
          ),
        ],
      ),
    );
  }
}
