import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/styles/theme_colors.dart';

/// Inputs are ruled lines, not boxes: a single 1px underline that thickens to
/// the accent on focus. Nothing is filled, so a field sits on the page like a
/// blank in a printed form.
class CUFieldTheme {
  const CUFieldTheme._();

  static const double _focusedWidth = 2.0;

  static UnderlineInputBorder _underline(Color color, double width) {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: color, width: width),
    );
  }

  static InputDecorationTheme _theme({
    required TextTheme textTheme,
    required Color border,
    required Color accent,
    required Color muted,
    required Color error,
  }) {
    return InputDecorationTheme(
      labelStyle: CUTextStyles.monoLabel.copyWith(color: muted),
      floatingLabelStyle: CUTextStyles.monoLabel.copyWith(color: accent),
      hintStyle: textTheme.bodyMedium,
      errorStyle: CUTextStyles.monoMeta.copyWith(color: error),
      border: _underline(border, CUSpacing.hairline),
      enabledBorder: _underline(border, CUSpacing.hairline),
      disabledBorder: _underline(border, CUSpacing.hairline),
      focusedBorder: _underline(accent, _focusedWidth),
      errorBorder: _underline(error, CUSpacing.hairline),
      focusedErrorBorder: _underline(error, _focusedWidth),
      contentPadding: const EdgeInsets.symmetric(vertical: CUSpacing.s12),
      isDense: false,
      filled: false,
    );
  }

  static final InputDecorationTheme lightInputTheme = _theme(
    textTheme: CUTextStyles.lightTheme,
    border: CUThemeColors.lightBorder,
    accent: CUThemeColors.lightAccent,
    muted: CUThemeColors.lightTextMuted,
    error: CUThemeColors.lightError,
  );

  static final InputDecorationTheme darkInputTheme = _theme(
    textTheme: CUTextStyles.darkTheme,
    border: CUThemeColors.darkBorder,
    accent: CUThemeColors.darkAccent,
    muted: CUThemeColors.darkTextMuted,
    error: CUThemeColors.darkError,
  );
}
