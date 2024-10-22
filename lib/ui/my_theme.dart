import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color(0xff004182);
  static Color whiteColor = const Color(0xffffffff);
  static Color darkBlueColor = const Color(0xff06004F);
  static Color mixColor = const Color(0xff004182);
  static Color pinkColor = const Color(0xffFF645A);
  static Color greenColor = const Color(0xff02B935);
  static Color yellowColor = const Color(0xffFDD835);
  static Color redColor = const Color(0xffBC3018);
  static Color blueColor = const Color(0xff0973DD);
  static Color blackColor = const Color(0xff2F2929);

  static ThemeData mainTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor),
        titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor),
      ));
}
