import 'package:currency/app/theme/app_dark_theme.dart';
import 'package:currency/app/theme/app_light_theme.dart';
import 'package:currency/app/theme/get_theme.dart';
import 'package:currency/ui/base_screen/view/base_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency',
      theme: getTheme(AppDarkTheme()),
      darkTheme: getTheme(AppLightTheme()),
      home: const BaseScreen(),
    );
  }
}
