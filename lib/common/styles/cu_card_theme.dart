import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/theme_colors.dart';

/// Cards in this system are not floating objects: they are regions bounded by
/// a hairline. Elevation 0, radius 0, one 1px rule.
class CUCardTheme {
  const CUCardTheme._();

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

  static const CardThemeData lightCardTheme = CardThemeData(
    color: CUThemeColors.lightBgAlt,
    surfaceTintColor: CUThemeColors.lightBgAlt,
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: _lightShape,
  );

  static const CardThemeData darkCardTheme = CardThemeData(
    color: CUThemeColors.darkBgAlt,
    surfaceTintColor: CUThemeColors.darkBgAlt,
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: _darkShape,
  );
}
