import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = const Color(0xff5D9CEC);
  static Color greenColor = const Color(0xff61E757);
  static Color scaffoldBackgroundColorLight = const Color(0xffDFECDB);
  static Color redColor = const Color(0xffEC4B4B);
  static Color greyColor = const Color(0xffC8C9CB);
  static Color whiteColor = const Color(0xffffffff);
  static Color blackColorLightkMode = const Color(0xff363636);
  static Color blackColorDarkMode = const Color(0xff060E1E);
  static Color gradientColor = const Color(0xff56D7BC);
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Poppins",
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
    ),
    primaryColor: primaryColor,
    useMaterial3: true,
    scaffoldBackgroundColor: scaffoldBackgroundColorLight,
    bottomNavigationBarTheme: buildNavigationBarThemeDataLight(),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: whiteColor,
        fontSize: 22,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "Poppins",
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
    ),
    primaryColor: primaryColor,
    useMaterial3: true,
    scaffoldBackgroundColor: blackColorDarkMode,
    bottomNavigationBarTheme: buildNavigationBarThemeDataDark(),
  );

  //Bottom bar theme data LIGHT
  static BottomNavigationBarThemeData buildNavigationBarThemeDataLight() {
    return BottomNavigationBarThemeData(
      backgroundColor: whiteColor,
      showUnselectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: greyColor,
    );
  }

  //Bottom bar theme data DARK
  static BottomNavigationBarThemeData buildNavigationBarThemeDataDark() {
    return BottomNavigationBarThemeData(
      elevation: 10,
      backgroundColor: blackColorDarkMode,
      showUnselectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: greyColor,
    );
  }
}
