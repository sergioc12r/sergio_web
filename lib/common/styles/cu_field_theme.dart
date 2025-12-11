import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/styles/theme_colors.dart';

/// Manage Input widgets styles
class CUFieldTheme {
  static InputDecorationTheme lightInputTheme = InputDecorationTheme(
    labelStyle: CUTextStyles.lightTheme.titleMedium,
    hintStyle: CUTextStyles.lightTheme.bodyMedium,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
          color: CUThemeColors.lightColorScheme.onSurface.withAlpha(175),
          width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
          color: CUThemeColors.lightColorScheme.onSurface.withAlpha(175),
          width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide:
          BorderSide(color: CUThemeColors.lightColorScheme.primary, width: 2.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: CUThemeColors.errorColor, width: 2.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: CUThemeColors.errorColor, width: 2.0),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    filled: true,
  );

  static InputDecorationTheme darkInputTheme = InputDecorationTheme(
    labelStyle: CUTextStyles.darkTheme.titleMedium,
    hintStyle: CUTextStyles.darkTheme.bodyMedium,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
          color: CUThemeColors.darkColorScheme.onSurface.withAlpha(175),
          width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
          color: CUThemeColors.darkColorScheme.onSurface.withAlpha(175),
          width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide:
          BorderSide(color: CUThemeColors.darkColorScheme.primary, width: 2.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: CUThemeColors.errorColor, width: 2.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: CUThemeColors.errorColor, width: 2.0),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    filled: true,
  );
}
