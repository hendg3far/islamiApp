import 'package:flutter/material.dart';

class AppTheme {

  static final Color primaryLightColor = Color(0xFFB7935F);
  static final Color whiteColor = Color(0xFFFFFFFF);
  static final Color darkColor = Color(0xFF242424);

  static final Color primaryDarkColor = Color(0xFF141A2E);
  static final Color goldColor = Color(0xFFFACC1D);

  static final ThemeData lightTheme = ThemeData(

    primaryColor: primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,

    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyle(
        color: darkColor
      )
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: darkColor),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: darkColor,
      )
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryLightColor,
      selectedItemColor: darkColor,
      unselectedItemColor: whiteColor,
    ),

    textTheme:  TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30,
        color: darkColor,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 25,
        color: darkColor,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 25,
        color: darkColor,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: darkColor,
      ),

      bodySmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: darkColor,
      ),
    ),


  );

  static final ThemeData darkTheme = ThemeData(

    primaryColor: primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,

    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: whiteColor),
        titleTextStyle: TextStyle(
          color: whiteColor,
        )
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryDarkColor,
      selectedItemColor: goldColor,
      unselectedItemColor: whiteColor,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30,
        color: whiteColor
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 25,
          color: whiteColor
      ),
      bodyLarge:  TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 25,
          color: whiteColor
      ),
      bodyMedium:  TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
          color: whiteColor
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: whiteColor,
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(
            color: whiteColor
        )
    ),

  );

}