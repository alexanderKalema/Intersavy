import 'package:android_app_development/constants.dart';
import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  fontFamily: 'PoppinsRegular',
  scaffoldBackgroundColor: SCAFFOLD_BACKGROUND_COLOR,
  iconTheme: const IconThemeData(
    color: ICON_COLOR,
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(
      color: MAIN_TEXT_COLOR,
    ),
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: 'PoppinsRegular',
      color: MAIN_TEXT_COLOR,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
    elevation: 0,
  ),
);
