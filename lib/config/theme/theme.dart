import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';

import '../../core/utils/text_styles.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: ColorsManager.green,
          titleTextStyle: TextStyles.appBar,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.r))),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.white70),
      border: InputBorder.none,
    ),
    drawerTheme: DrawerThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
    scaffoldBackgroundColor: Colors.white,
  );
}