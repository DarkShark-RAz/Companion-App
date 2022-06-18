import 'package:companion_app/services/custom_colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

class AppThemes {
  AppThemes._();

  // light theme
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: CustomColors.appGreen,
    ),
    brightness: Brightness.light,
    fontFamily: 'JekoThin',
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: CustomColors.appGreen,
    ),

    //todo add theme colors later
  );
}
