import 'package:bookly/core/constant/app_sizes.dart';
import 'package:bookly/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding.w),
      child: const Column(children: [CustomAppBar()]),
    );
  }
}
