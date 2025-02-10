import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  static TextStyle abbBar = GoogleFonts.inter(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static TextStyle label = const TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
  );

  static TextStyle hint = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.hint,
    fontSize: 14.sp,
  );
  static TextStyle button = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    fontSize: 16.sp,
  );
  static TextStyle alreadyHaveAnAccount = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static TextStyle alreadyHaveAnAccountLogin = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.darkBlue,
    decoration: TextDecoration.underline,
  );
}
