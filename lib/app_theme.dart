import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = Color(0xff5d9cec);
  static Color backgroundColorLight = Color(0xffdfecdb);
  static Color backgroundColorDark = Color(0xff060e1e);
  static Color greenColor = Color(0xff61e757);
  static Color redColor = Color(0xffec4b4b);
  static Color blackColor = Color(0xff141922);
  static Color greyColor = Color(0xffc8c9cb);
  static Color whiteColor = Color(0xffffffff);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        titleTextStyle: TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        )),
    scaffoldBackgroundColor: backgroundColorLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: greyColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: whiteColor,
      shape: CircleBorder(side: BorderSide(color: whiteColor, width: 3)),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: blackColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: blackColor,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: primaryColor),
    scaffoldBackgroundColor: backgroundColorDark,
  );
}
