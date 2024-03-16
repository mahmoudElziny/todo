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
    appBarTheme: AppBarTheme(backgroundColor: primaryColor),
    scaffoldBackgroundColor: backgroundColorLight,
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: primaryColor),
    scaffoldBackgroundColor: backgroundColorDark,
  );
}
