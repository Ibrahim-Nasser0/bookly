import 'package:bookly/core/constant/app_assets.dart';
import 'package:bookly/core/constant/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, this.small = false});
  final bool small;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: small ? AppSizes.smallCardWidth.w : AppSizes.cardWidth.w,
      height: small ? AppSizes.smallCardHeight.h : AppSizes.cardHeight.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.borderRadius.r),
        image: const DecorationImage(
          image: AssetImage(AppAssets.coverBook),
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.all(5.sp),
      child: small
          ? null
          : IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.transparent.withOpacity(0.9),
                child: Icon(Icons.play_arrow, size: AppSizes.largIconSize.sp),
              ),
            ),
    );
  }
}
