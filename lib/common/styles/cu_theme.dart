import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';

/// Manage Custom Theme
class CUThemeData {
  static ThemeData lightTheme = ThemeData(
    fontFamily: CUTextStyles.fontFamily,
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: CUTextStyles.lightTheme,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: CUTextStyles.fontFamily,
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: CUTextStyles.darkTheme,
  );
}