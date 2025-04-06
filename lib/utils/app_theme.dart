import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentcolor,
    textTheme: TextTheme(headlineLarge: AppStyles.bold16White),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackBgColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primarycolor)
    )
  );
}