
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/colors_manager.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(

    colorScheme: ColorScheme.dark(
      primary: ColorsManager.darkBlack,
      onPrimary: ColorsManager.white,
      tertiary: ColorsManager.gold,
      onTertiary: ColorsManager.lightGray,
      onSecondary: ColorsManager.darkGray,
      onSecondaryContainer: ColorsManager.red
    ),

    textTheme: TextTheme(

      bodyLarge: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          color: ColorsManager.white
      ),
      bodyMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: ColorsManager.white
      ),
      displayLarge: TextStyle(
          fontSize: 36.sp,
          fontWeight: FontWeight.w700,
          color: ColorsManager.white
      ),
      labelMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: ColorsManager.white
      ),
      labelSmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: ColorsManager.white
      ),
      titleMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: ColorsManager.darkBlack
      ),
      titleSmall: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w900,
          color: ColorsManager.white
      ),
      displaySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.gold
      )

    ),
    dividerTheme: DividerThemeData(
      color: ColorsManager.gold,
      endIndent: 25,
      indent: 20,
    )

  );
}