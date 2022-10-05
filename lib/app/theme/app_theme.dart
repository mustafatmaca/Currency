import 'package:flutter/material.dart';

abstract class AppTheme {
  late final Brightness brightness;
  late final Color backgroundColor;
  late final Color scaffoldBackgroundColor;
  late final IconThemeData iconTheme;
  late final Color bottomAppBarColor = Colors.black;
  late final Color dividerColor;
  late final TextTheme textTheme;
  late final ElevatedButtonThemeData elevatedButtonTheme;
  late final OutlinedButtonThemeData outlinedButtonTheme;
  late final AppBarTheme appBarTheme;
  late final BottomNavigationBarThemeData bottomNavigationBarThemeData;
}
