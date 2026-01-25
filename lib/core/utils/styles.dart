import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static final titleMedium = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static final subTitle = GoogleFonts.montserrat(
    color: Colors.white70,
    fontSize: 14.sp,

    fontWeight: FontWeight.w500,
  );
}
