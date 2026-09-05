import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/theme_colors.dart';

/// Iconography is nearly absent from this system by design. What is left
/// (drawer handle, social marks) reads as muted ink, never as decoration.
class CUIconTheme {
  const CUIconTheme._();

  static const IconThemeData lightIconTheme = IconThemeData(
    color: CUThemeColors.lightTextMuted,
    size: CUSizing.icon,
  );

  static const IconThemeData darkIconTheme = IconThemeData(
    color: CUThemeColors.darkTextMuted,
    size: CUSizing.icon,
  );
}
