import 'package:flutter/material.dart';

class CUTextStyles {
  static const String _fontFamily = 'Roboto';

  static String get fontFamily => _fontFamily;

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _bold = FontWeight.w700;

  /// Auto generate TextTheme based on baseTextColor
  static TextTheme generateTextTheme(Color baseTextColor) {
    final Color secondaryTextColor = baseTextColor.withAlpha(179);
    final Color tertiaryTextColor = baseTextColor.withAlpha(127);

    return TextTheme(
      // DISPLAY (Large titles)
      displayLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _regular,
        fontSize: 57,
        color: baseTextColor,
      ),
      displayMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _regular,
        fontSize: 45,
        color: baseTextColor,
      ),
      displaySmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _regular,
        fontSize: 36,
        color: baseTextColor,
      ),

      // HEADLINE (Primary Section Titles)
      headlineLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _bold,
        fontSize: 32,
        color: baseTextColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _bold,
        fontSize: 28,
        color: baseTextColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _medium,
        fontSize: 24,
        color: baseTextColor,
      ),

      // TITLE (Secondary titles, lists, cards)
      titleLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _medium,
        fontSize: 22,
        color: baseTextColor,
      ),
      titleMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _medium,
        fontSize: 16,
        color: baseTextColor,
      ),
      titleSmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _medium,
        fontSize: 14,
        color: baseTextColor,
      ),

      // BODY (body, general texts)
      bodyLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _regular,
        fontSize: 16,
        color: secondaryTextColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _regular,
        fontSize: 14,
        color: secondaryTextColor,
      ),
      bodySmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _regular,
        fontSize: 12,
        color: tertiaryTextColor,
      ),

      // LABEL (Buttons, support texts, small texts) ---
      labelLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _medium,
        fontSize: 14,
        color: baseTextColor,
      ),
      labelMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _medium,
        fontSize: 12,
        color: tertiaryTextColor,
      ),
      labelSmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _medium,
        fontSize: 11,
        color: tertiaryTextColor,
      ),
    );
  }

  /// Basic static TextTheme for the app

  /// Light Theme
  static TextTheme lightTheme = generateTextTheme(Colors.black);

  /// Dark Theme
  static TextTheme darkTheme = generateTextTheme(Colors.white);
}
