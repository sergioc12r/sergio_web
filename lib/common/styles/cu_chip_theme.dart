import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/styles/theme_colors.dart';

/// The redesign removed every colored chip from the product — tech lists are
/// plain mono text now. This theme only survives so that any incidental
/// Material [Chip] stays inside the system instead of falling back to the
/// purple M3 defaults.
class CUChipTheme {
  const CUChipTheme._();

  static const RoundedRectangleBorder _lightShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
    side: BorderSide(
      width: CUSpacing.hairline,
      color: CUThemeColors.lightBorder,
    ),
  );

  static const RoundedRectangleBorder _darkShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
    side: BorderSide(
      width: CUSpacing.hairline,
      color: CUThemeColors.darkBorder,
    ),
  );

  static final ChipThemeData lightChipTheme = ChipThemeData(
    backgroundColor: CUThemeColors.lightBg,
    selectedColor: CUThemeColors.lightBgAlt,
    disabledColor: CUThemeColors.lightBgAlt,
    labelStyle: CUTextStyles.monoTag.copyWith(
      color: CUThemeColors.lightTextMuted,
    ),
    side: BorderSide.none,
    shape: _lightShape,
    showCheckmark: false,
    elevation: 0,
    pressElevation: 0,
  );

  static final ChipThemeData darkChipTheme = ChipThemeData(
    backgroundColor: CUThemeColors.darkBg,
    selectedColor: CUThemeColors.darkBgAlt,
    disabledColor: CUThemeColors.darkBgAlt,
    labelStyle: CUTextStyles.monoTag.copyWith(
      color: CUThemeColors.darkTextMuted,
    ),
    side: BorderSide.none,
    shape: _darkShape,
    showCheckmark: false,
    elevation: 0,
    pressElevation: 0,
  );
}
