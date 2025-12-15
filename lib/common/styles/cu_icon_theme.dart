import 'package:flutter/cupertino.dart';
import 'package:sergio_web/common/styles/theme_colors.dart';

class CUIconTheme {
  static IconThemeData lightIconTheme = IconThemeData(
    color: CUThemeColors.backgroundDark,
    size: 24
  );

  static IconThemeData darkIconTheme = IconThemeData(
    color: CUThemeColors.onPrimary,
    size: 24
  );
}