import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class TextStyles {
  static TextStyle appBar = GoogleFonts.exo(
      fontSize: 22.sp, fontWeight: FontWeight.w400, color: Colors.white);
  static TextStyle drawerTitle = GoogleFonts.poppins(
      fontSize: 24.sp, fontWeight: FontWeight.w700, color: Colors.white);
  static TextStyle drawerItem = GoogleFonts.poppins(
      fontSize: 24.sp, fontWeight: FontWeight.w700, color: ColorsManager.black);
  static TextStyle picCategories = GoogleFonts.poppins(
      fontSize: 22.sp, fontWeight: FontWeight.w700, color: ColorsManager.gray);
  static TextStyle categoriesTitle = GoogleFonts.poppins(
      fontSize: 22.sp, fontWeight: FontWeight.w400, color: Colors.white);
}
