// ignore_for_file: implementation_imports

import 'dart:ui';

import 'package:currency/app/theme/app_colors.dart';
import 'package:currency/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon_theme_data.dart';
import 'package:flutter/src/material/text_theme.dart';
import 'package:flutter/src/material/outlined_button_theme.dart';
import 'package:flutter/src/material/elevated_button_theme.dart';
import 'package:flutter/src/material/app_bar_theme.dart';

class AppDarkTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.light;
  @override
  Color backgroundColor = AppColors.darkBackground;
  @override
  Color scaffoldBackgroundColor = AppColors.darkBackground;
  @override
  Color bottomAppBarColor = AppColors.button;
  @override
  Color dividerColor = AppColors.button;
  @override
  IconThemeData iconTheme = const IconThemeData(color: AppColors.button);

  @override
  AppBarTheme appBarTheme = const AppBarTheme(
    color: AppColors.darkBackground,
    centerTitle: true,
  );

  @override
  ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.button),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)))));

  @override
  OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          primary: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 20),
          textStyle: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          side: const BorderSide(width: 1.0, color: AppColors.button)));

  @override
  TextTheme textTheme = const TextTheme(
      //Headline
      headline1: TextStyle(
        fontSize: 18,
        color: AppColors.darkText,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.darkText,
      ),
      bodyText1: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.darkText));

  @override
  BottomNavigationBarThemeData bottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: AppColors.lightBackground,
          unselectedItemColor: AppColors.opaqueBackground.withOpacity(0.5),
          type: BottomNavigationBarType.fixed);
}
