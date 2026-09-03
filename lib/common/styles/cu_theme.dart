import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_app_bar_theme.dart';
import 'package:sergio_web/common/styles/cu_button_theme.dart';
import 'package:sergio_web/common/styles/cu_card_theme.dart';
import 'package:sergio_web/common/styles/cu_chip_theme.dart';
import 'package:sergio_web/common/styles/cu_field_theme.dart';
import 'package:sergio_web/common/styles/cu_icon_theme.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/styles/theme_colors.dart';

/// Manage Custom Theme
class CUThemeData {
  const CUThemeData._();

  static DividerThemeData _divider(Color color) => DividerThemeData(
    color: color,
    thickness: CUSpacing.hairline,
    space: CUSpacing.hairline,
  );

  static ThemeData lightTheme = ThemeData(
    fontFamily: CUTextStyles.fontFamily,
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: CUTextStyles.lightTheme,
    scaffoldBackgroundColor: CUThemeColors.lightBg,
    canvasColor: CUThemeColors.lightBg,
    cardColor: CUThemeColors.lightBgAlt,
    dividerColor: CUThemeColors.lightBorder,
    dividerTheme: _divider(CUThemeColors.lightBorder),
    cardTheme: CUCardTheme.lightCardTheme,
    appBarTheme: CUAppBarTheme.lightAppBarTheme,
    chipTheme: CUChipTheme.lightChipTheme,
    inputDecorationTheme: CUFieldTheme.lightInputTheme,
    colorScheme: CUThemeColors.lightColorScheme,
    elevatedButtonTheme: CUButtonTheme.lightElevatedButtonTheme,
    iconButtonTheme: CUButtonTheme.lightIconButtonTheme,
    iconTheme: CUIconTheme.lightIconTheme,
    drawerTheme: const DrawerThemeData(
      backgroundColor: CUThemeColors.lightBg,
      surfaceTintColor: CUThemeColors.lightBg,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: CUTextStyles.fontFamily,
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: CUTextStyles.darkTheme,
    scaffoldBackgroundColor: CUThemeColors.darkBg,
    canvasColor: CUThemeColors.darkBg,
    cardColor: CUThemeColors.darkBgAlt,
    dividerColor: CUThemeColors.darkBorder,
    dividerTheme: _divider(CUThemeColors.darkBorder),
    cardTheme: CUCardTheme.darkCardTheme,
    appBarTheme: CUAppBarTheme.darkAppBarTheme,
    chipTheme: CUChipTheme.darkChipTheme,
    inputDecorationTheme: CUFieldTheme.darkInputTheme,
    colorScheme: CUThemeColors.darkColorScheme,
    elevatedButtonTheme: CUButtonTheme.darkElevatedButtonTheme,
    iconButtonTheme: CUButtonTheme.darkIconButtonTheme,
    iconTheme: CUIconTheme.darkIconTheme,
    drawerTheme: const DrawerThemeData(
      backgroundColor: CUThemeColors.darkBg,
      surfaceTintColor: CUThemeColors.darkBg,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
  );
}
