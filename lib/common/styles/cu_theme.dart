import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_app_bar_theme.dart';
import 'package:sergio_web/common/styles/cu_button_theme.dart';
import 'package:sergio_web/common/styles/cu_card_theme.dart';
import 'package:sergio_web/common/styles/cu_chip_theme.dart';
import 'package:sergio_web/common/styles/cu_field_theme.dart';
import 'package:sergio_web/common/styles/cu_icon_theme.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/styles/theme_colors.dart';

/// Manage Custom Theme
class CUThemeData {
  static ThemeData lightTheme = ThemeData(
    fontFamily: CUTextStyles.fontFamily,
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: CUTextStyles.lightTheme,
    canvasColor: CUThemeColors.lightCanvasColor,
    cardColor: CUThemeColors.lightCardColor,
    cardTheme: CUCardTheme.lightCardTheme,
    appBarTheme: CUAppBarTheme.lightAppBarTheme,
    chipTheme: CUChipTheme.lightChipTheme,
    inputDecorationTheme: CUFieldTheme.lightInputTheme,
    colorScheme: CUThemeColors.lightColorScheme,
    elevatedButtonTheme: CUButtonTheme.lightElevatedButtonTheme,
    iconButtonTheme: CUButtonTheme.lightIconButtonTheme,
    iconTheme: CUIconTheme.lightIconTheme,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: CUTextStyles.fontFamily,
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: CUTextStyles.darkTheme,
    canvasColor: CUThemeColors.darkCanvasColor,
    cardColor: CUThemeColors.darkCardColor,
    cardTheme: CUCardTheme.darkCardTheme,
    appBarTheme: CUAppBarTheme.darkAppBarTheme,
    chipTheme: CUChipTheme.darkChipTheme,
    inputDecorationTheme: CUFieldTheme.darkInputTheme,
    colorScheme: CUThemeColors.darkColorScheme,
    elevatedButtonTheme: CUButtonTheme.darkElevatedButtonTheme,
    iconButtonTheme: CUButtonTheme.darkIconButtonTheme,
    iconTheme: CUIconTheme.darkIconTheme,
  );
}
