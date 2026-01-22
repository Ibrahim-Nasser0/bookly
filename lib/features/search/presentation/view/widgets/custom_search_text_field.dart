import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Styles.titleMedium,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.white, width: 0.5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.white, width: 1.w),
        ),
        hintText: 'Search',
        hintStyle: Styles.subTitle,
        suffixIcon: Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 18.h,
          color: Colors.white.withOpacity(0.7),
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}
