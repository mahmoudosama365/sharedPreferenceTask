import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Appcolors.whiteBgColor,
    primaryColor: Appcolors.primaryLight,
    focusColor: Appcolors.whiteColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Appcolors.primaryLight,
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedItemColor: Appcolors.whiteColor,
      selectedLabelStyle: AppStyles.bold12White,
      unselectedLabelStyle: AppStyles.bold12White,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Appcolors.primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
        side: BorderSide(
          color: Appcolors.whiteColor,
          width: 6,
        )
      )
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20Black,
      headlineMedium: AppStyles.bold20Black,
      headlineSmall: AppStyles.medium16Primary, 
      bodyLarge: AppStyles.bold16Black
    ),
    
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Appcolors.primaryDark,
    primaryColor: Appcolors.primaryDark,
    focusColor: Appcolors.primaryLight,
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedItemColor: Appcolors.whiteColor,
       selectedLabelStyle: AppStyles.bold12White,
      unselectedLabelStyle: AppStyles.bold12White,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Appcolors.primaryDark,
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
        side: BorderSide(
          color: Appcolors.whiteColor,
          width: 6,
        )
      )
    ),
    textTheme: TextTheme(
        headlineLarge: AppStyles.bold20White,
        headlineMedium: AppStyles.bold20Black,
        headlineSmall: AppStyles.medium16White,
        bodyLarge: AppStyles.bold16White
    ),
  );  

}