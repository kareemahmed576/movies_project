
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/color_manager.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(

    colorScheme: ColorScheme.dark(
      primary: ColorManager.darkBlack,
      onPrimary: ColorManager.white,
      tertiary: ColorManager.gold,
      onSecondary: ColorManager.darkGray,
      onSecondaryContainer: ColorManager.red
    ),

    textTheme: TextTheme(

      bodyLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: ColorManager.white
      ),
      displayLarge: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w700,
        color: ColorManager.white
      ),
      labelMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: ColorManager.white
      ),
      titleMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: ColorManager.darkBlack
      ),

    )

  );
}