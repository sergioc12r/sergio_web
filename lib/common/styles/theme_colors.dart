import 'package:flutter/material.dart';

/// Design tokens for the editorial/technical system.
///
/// Values were converted from oklch to sRGB once, by hand: Flutter has no
/// oklch color space, so the oklch source is kept only as documentation.
/// Do NOT recalculate these at runtime.
class CUThemeColors {
  const CUThemeColors._();

  /// LIGHT
  static const Color lightBg = Color(0xFFF8F8FA);

  /// oklch(98% 0.003 290)
  static const Color lightBgAlt = Color(0xFFEEEEF2);

  /// oklch(95% 0.006 290)
  static const Color lightText = Color(0xFF1A1A1F);

  /// oklch(22% 0.01  290)
  static const Color lightTextMuted = Color(0xFF55545B);

  /// oklch(45% 0.01  290)
  static const Color lightBorder = Color(0xFFCDCDD3);

  /// oklch(85% 0.008 290)
  static const Color lightAccent = Color(0xFF5F4BA6);

  /// oklch(48% 0.14  290)

  /// DARK
  static const Color darkBg = Color(0xFF0F0F13);

  /// oklch(17% 0.008 290)
  static const Color darkBgAlt = Color(0xFF1A1A1F);

  /// oklch(22% 0.01  290)
  static const Color darkText = Color(0xFFEBEBEE);

  /// oklch(94% 0.004 290)
  static const Color darkTextMuted = Color(0xFF98979E);

  /// oklch(68% 0.01  290)
  static const Color darkBorder = Color(0xFF32323A);

  /// oklch(32% 0.015 290)

  /// oklch(78% 0.1202 290) — chroma 0.13 falls outside the sRGB gamut at this
  /// lightness, 0.1202 is the maximum in-gamut value.
  static const Color darkAccent = Color(0xFFB6AAFF);

  /// Error stays as it was: it is the only semantic color outside the system.
  static const Color lightError = Color(0xFFB00020);
  static const Color darkError = Color(0xFFCF6679);

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: lightAccent,
    onPrimary: lightBg,
    secondary: lightTextMuted,
    onSecondary: lightBg,
    error: lightError,
    onError: lightBg,
    surface: lightBg,
    onSurface: lightText,
    onSurfaceVariant: lightTextMuted,
    surfaceContainerLowest: lightBg,
    surfaceContainer: lightBgAlt,
    surfaceContainerHighest: lightBgAlt,
    outline: lightBorder,
    outlineVariant: lightBorder,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: darkAccent,
    onPrimary: darkBg,
    secondary: darkTextMuted,
    onSecondary: darkBg,
    error: darkError,
    onError: darkBg,
    surface: darkBg,
    onSurface: darkText,
    onSurfaceVariant: darkTextMuted,
    surfaceContainerLowest: darkBg,
    surfaceContainer: darkBgAlt,
    surfaceContainerHighest: darkBgAlt,
    outline: darkBorder,
    outlineVariant: darkBorder,
  );
}
