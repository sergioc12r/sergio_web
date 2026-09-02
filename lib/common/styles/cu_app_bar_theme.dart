import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/styles/theme_colors.dart';

/// The nav is a rule across the top of the page, not a floating bar. Opaque
/// background, zero elevation, one hairline underneath — so that content
/// scrolling past it never bleeds through.
class CUAppBarTheme {
  const CUAppBarTheme._();

  static AppBarTheme _theme({
    required Color background,
    required Color ink,
    required Color border,
  }) {
    return AppBarTheme(
      backgroundColor: background,
      foregroundColor: ink,
      surfaceTintColor: background,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: false,
      toolbarHeight: CUSizing.toolbarHeight,
      titleSpacing: CUSpacing.s20,
      titleTextStyle: CUTextStyles.monoLabel.copyWith(color: ink),
      iconTheme: IconThemeData(color: ink, size: CUSizing.icon),
      actionsIconTheme: IconThemeData(color: ink, size: CUSizing.icon),
      shape: Border(
        bottom: BorderSide(width: CUSpacing.hairline, color: border),
      ),
    );
  }

  static final AppBarTheme lightAppBarTheme = _theme(
    background: CUThemeColors.lightBg,
    ink: CUThemeColors.lightText,
    border: CUThemeColors.lightBorder,
  );

  static final AppBarTheme darkAppBarTheme = _theme(
    background: CUThemeColors.darkBg,
    ink: CUThemeColors.darkText,
    border: CUThemeColors.darkBorder,
  );
}
