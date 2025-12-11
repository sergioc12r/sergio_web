import 'package:flutter/material.dart';

class CUThemeColors {
  /// Background Scaffold Color
  static const Color lightCanvasColor = Color(0x80B8C6FF);

  static const Color darkCanvasColor = Color(0xFF000000);

  /// Background Cards Colors
  static const Color lightCardColor = Colors.white;

  static const Color darkCardColor = Color(0xFF000B20);

  /// Error color
  static const Color errorColor = Color(0xFFB00020);

  /// Primary Color
  static const Color primaryLight = Color(0xFF007BFF);
  static const Color primaryDark = Color(0xFF77B2FB);

  /// BackgroundColor
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF121212);

  /// Surface Color
  static const Color surfaceLight = Color(0xFFF5F5F5);
  static const Color surfaceDark = Color(0xFF212121);

  /// Secondary Color
  static const Color secondaryLight = Color(0xFF03DAC6);
  static const Color secondaryDark = Color(0xFF018786);

  /// On Primary Color
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// Schema
  static ColorScheme lightColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: primaryLight,
      onPrimary: onPrimary,
      secondary: secondaryLight,
      onSecondary: backgroundDark,
      error: backgroundLight,
      onError: errorColor,
      surface: surfaceLight,
      onSurface: backgroundDark);

  static ColorScheme darkColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: primaryDark,
      onPrimary: onPrimary,
      secondary: secondaryDark,
      onSecondary: backgroundLight,
      error: backgroundDark,
      onError: errorColor,
      surface: surfaceDark,
      onSurface: backgroundLight);
}
