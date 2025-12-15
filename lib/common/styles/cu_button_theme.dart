import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_icon_theme.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/styles/theme_colors.dart';

class CUButtonTheme {
  static ElevatedButtonThemeData lightElevatedButtonTheme =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: CUThemeColors.backgroundDark,
      backgroundColor: CUThemeColors.primaryLight,
      textStyle: CUTextStyles.lightTheme.titleMedium,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      elevation: 4,
      animationDuration: const Duration(milliseconds: 500),
      enableFeedback: true,
    ),
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: CUThemeColors.backgroundLight,
      backgroundColor: CUThemeColors.primaryDark,
      textStyle: CUTextStyles.darkTheme.titleMedium,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      elevation: 4,
      animationDuration: const Duration(milliseconds: 500),
      enableFeedback: true,
    ),
  );

  static IconButtonThemeData lightIconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all(CUIconTheme.darkIconTheme.color),
        textStyle: WidgetStateProperty.all(CUTextStyles.lightTheme.titleMedium!.copyWith(color: Colors.white)),
      ),
  );

  static IconButtonThemeData darkIconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all(CUIconTheme.darkIconTheme.color),
      textStyle: WidgetStateProperty.all(CUTextStyles.lightTheme.titleMedium!.copyWith(color: Colors.white)),
    ),
  );
}
