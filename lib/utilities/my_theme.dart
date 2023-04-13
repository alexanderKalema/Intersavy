import 'package:android_app_development/constants.dart';
import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  // fontFamily: '',
  scaffoldBackgroundColor: const Color(SCAFFOLD_BACKGROUND_COLOR),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Color(MAIN_TEXT_COLOR),
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ),
    elevation: 0,
  ),
);
