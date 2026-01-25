

import 'package:bookly/core/constant/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RateingRow extends StatelessWidget {
  const RateingRow({
    super.key,
    required this.rating,
    required this.ratingCount,
  });
  final double rating;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Colors.amber, size: AppSizes.smallIconSize.sp),
        Gap(2.w),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: rating.toString(), // Rating
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
              TextSpan(
                text: ' ($ratingCount)', // Number of Ratings
                style: TextStyle(color: Colors.white70, fontSize: 14.sp),
              ),
            ],
          ),

          // style: TextStyle(color: Colors.white, fontSize: 14.sp),
        ),
      ],
    );
  }
}
