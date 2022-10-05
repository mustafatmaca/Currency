import 'package:currency/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

ThemeData getTheme<T extends AppTheme>(T theme) => ThemeData(
    backgroundColor: theme.backgroundColor,
    scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
    textTheme: theme.textTheme,
    appBarTheme: theme.appBarTheme,
    bottomAppBarColor: theme.bottomAppBarColor,
    iconTheme: theme.iconTheme,
    brightness: theme.brightness,
    elevatedButtonTheme: theme.elevatedButtonTheme,
    outlinedButtonTheme: theme.outlinedButtonTheme,
    dividerColor: theme.dividerColor);
