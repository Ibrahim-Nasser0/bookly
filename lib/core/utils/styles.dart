import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles {
  static final titleMedium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'Montserrat',
    overflow: TextOverflow.ellipsis,
  );
  static final subTitle = TextStyle(
    color: Colors.white,
    fontSize: 14.sp,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
  );
}
