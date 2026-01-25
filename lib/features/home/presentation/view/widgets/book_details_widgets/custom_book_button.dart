import 'package:bookly/core/constant/app_sizes.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookButton extends StatelessWidget {
  const CustomBookButton({
    super.key,
    this.left = true,
    required this.text,
    required this.onPressed,
  });
  final bool left;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size(130.w, 45.h),

        shape: RoundedRectangleBorder(
          borderRadius: left
              ? BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.borderRadius.r),
                  bottomLeft: Radius.circular(AppSizes.borderRadius.r),
                )
              : BorderRadius.only(
                  topRight: Radius.circular(AppSizes.borderRadius.r),
                  bottomRight: Radius.circular(AppSizes.borderRadius.r),
                ),
        ),
        backgroundColor: left ? Colors.white : Color(0xffEF8262),
        foregroundColor: left ? Color(0xffEF8262) : Colors.white,
        textStyle: Styles.titleMedium,
      ),
      child: Text(
        text,
        style: Styles.titleMedium.copyWith(
          color: left ? Colors.black : Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
