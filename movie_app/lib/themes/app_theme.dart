import 'package:flutter/material.dart';

enum AppTheme {
  Light,
  Dark,
}

final appThemeData = {
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromRGBO(29, 29, 39, 1),
    accentColor: Color.fromRGBO(3, 218, 197, 1),
    cursorColor: Color.fromRGBO(3, 218, 197, 1),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
    ),
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color.fromRGBO(29, 29, 39, 1),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
    ),
  ),
};
