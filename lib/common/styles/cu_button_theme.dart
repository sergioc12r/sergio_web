import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/styles/theme_colors.dart';

/// There is no filled button anywhere in this design. Actions are underlined
/// text links, which is why the shared button style is flat, transparent and
/// borderless — it exists to give text links a hit target and a focus ring,
/// not to look like a button.
class CUButtonTheme {
  const CUButtonTheme._();

  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: CUSpacing.s12,
    vertical: CUSpacing.s8,
  );

  static const RoundedRectangleBorder _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
  );

  static ElevatedButtonThemeData _elevated(Color ink, Color overlay) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ink,
        backgroundColor: Colors.transparent,
        disabledForegroundColor: overlay,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        overlayColor: overlay,
        textStyle: CUTextStyles.monoLabel,
        shape: _shape,
        padding: _padding,
        elevation: 0,
        minimumSize: const Size(0, CUSizing.minTapTarget),
        tapTargetSize: MaterialTapTargetSize.padded,
        animationDuration: const Duration(milliseconds: 150),
      ),
    );
  }

  static IconButtonThemeData _iconButton(Color ink) {
    return IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll<Color>(ink),
        foregroundColor: WidgetStatePropertyAll<Color>(ink),
        backgroundColor: const WidgetStatePropertyAll<Color>(
          Colors.transparent,
        ),
        textStyle: const WidgetStatePropertyAll<TextStyle>(
          CUTextStyles.monoLabel,
        ),
        shape: const WidgetStatePropertyAll<OutlinedBorder>(_shape),
        minimumSize: const WidgetStatePropertyAll<Size>(
          Size.square(CUSizing.minTapTarget),
        ),
      ),
    );
  }

  static final ElevatedButtonThemeData lightElevatedButtonTheme = _elevated(
    CUThemeColors.lightText,
    CUThemeColors.lightBgAlt,
  );

  static final ElevatedButtonThemeData darkElevatedButtonTheme = _elevated(
    CUThemeColors.darkText,
    CUThemeColors.darkBgAlt,
  );

  static final IconButtonThemeData lightIconButtonTheme = _iconButton(
    CUThemeColors.lightTextMuted,
  );

  static final IconButtonThemeData darkIconButtonTheme = _iconButton(
    CUThemeColors.darkTextMuted,
  );
}
