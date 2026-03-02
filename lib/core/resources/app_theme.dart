
import 'package:flutter/material.dart';
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
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: ColorManager.white
      ),
      displayLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: ColorManager.white
      ),

    )

  );
}