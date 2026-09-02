import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/theme_colors.dart';

/// Typography for the editorial/technical system.
///
/// Two families do the whole job:
///  - Manrope carries every human-readable line (titles, body).
///  - IBM Plex Mono carries every machine-ish label (section numbers,
///    eyebrows, dates, tags, stats).
///
/// [ThemeData.fontFamily] only accepts ONE family, so Manrope is the global
/// default and the mono styles below have to be applied explicitly.
///
/// A note on [TextStyle.letterSpacing]: in Flutter it is an ABSOLUTE value in
/// logical pixels, unlike the relative `em` of CSS. The 0.05–0.08em of the
/// original spec is converted per size:
///   0.07em on 12px -> 0.84
///   0.07em on 13px -> 0.91
/// [TextStyle.height] on the other hand IS a multiplier and maps 1:1 to a
/// unitless CSS `line-height`.
class CUTextStyles {
  const CUTextStyles._();

  static const String fontFamily = 'Manrope';
  static const String monoFamily = 'IBMPlexMono';

  static const FontWeight _regular = FontWeight.w400;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _semiBold = FontWeight.w600;
  static const FontWeight _bold = FontWeight.w700;
  static const FontWeight _extraBold = FontWeight.w800;

  /// Mono styles.
  ///
  /// They deliberately carry no color: [Text] merges them onto the ambient
  /// [DefaultTextStyle], so they inherit the right color per theme, and a
  /// caller that wants emphasis does `.copyWith(color: colors.primary)`.

  /// The "01" / "02" that numbers each section.
  static const TextStyle monoSectionNumber = TextStyle(
    fontFamily: monoFamily,
    fontWeight: _semiBold,
    fontSize: 13,
    height: 1.2,
    letterSpacing: 0.91,
  );

  /// Eyebrow label above a heading. Always rendered UPPERCASE by the caller.
  static const TextStyle monoLabel = TextStyle(
    fontFamily: monoFamily,
    fontWeight: _medium,
    fontSize: 12,
    height: 1.4,
    letterSpacing: 0.84,
  );

  /// Inline tag / list item, e.g. the " · " separated tech lists.
  static const TextStyle monoTag = TextStyle(
    fontFamily: monoFamily,
    fontWeight: _regular,
    fontSize: 13,
    height: 1.6,
    letterSpacing: 0.26,
  );

  /// Dates, locations, secondary metadata.
  static const TextStyle monoMeta = TextStyle(
    fontFamily: monoFamily,
    fontWeight: _regular,
    fontSize: 12,
    height: 1.6,
    letterSpacing: 0.36,
  );

  /// Large figure of a statistic. Paired with [monoLabel] underneath.
  static const TextStyle monoStat = TextStyle(
    fontFamily: monoFamily,
    fontWeight: _medium,
    fontSize: 32,
    height: 1.1,
    letterSpacing: -0.5,
  );

  /// Builds the Material [TextTheme].
  ///
  /// [text] is the ink for anything that leads; [muted] is for running copy
  /// and support text. There is no third color — hierarchy comes from size
  /// and weight, not from more hues.
  static TextTheme generateTextTheme({
    required Color text,
    required Color muted,
  }) {
    return TextTheme(
      /// H1 of the hero. 44px is deliberately moderate: the page opens with a
      /// sentence, not with a billboard.
      displayLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _extraBold,
        fontSize: 56,
        height: 1.08,
        letterSpacing: -1.4,
        color: text,
      ),
      displayMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _bold,
        fontSize: 48,
        height: 1.12,
        letterSpacing: -1.0,
        color: text,
      ),
      displaySmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _bold,
        fontSize: 44,
        height: 1.15,
        letterSpacing: -0.8,
        color: text,
      ),

      /// H2 of each section.
      headlineLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _bold,
        fontSize: 32,
        height: 1.2,
        letterSpacing: -0.6,
        color: text,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _bold,
        fontSize: 28,
        height: 1.25,
        letterSpacing: -0.5,
        color: text,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _semiBold,
        fontSize: 22,
        height: 1.3,
        letterSpacing: -0.3,
        color: text,
      ),

      /// Row / entry titles.
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _semiBold,
        fontSize: 20,
        height: 1.35,
        letterSpacing: -0.2,
        color: text,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _semiBold,
        fontSize: 17,
        height: 1.4,
        color: text,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _medium,
        fontSize: 15,
        height: 1.4,
        color: text,
      ),

      /// Running copy. 1.75 leading is what makes long paragraphs readable.
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _regular,
        fontSize: 16,
        height: 1.75,
        color: muted,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _regular,
        fontSize: 15,
        height: 1.7,
        color: muted,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _regular,
        fontSize: 13,
        height: 1.6,
        color: muted,
      ),

      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _medium,
        fontSize: 15,
        height: 1.4,
        color: text,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _medium,
        fontSize: 13,
        height: 1.4,
        color: muted,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: _medium,
        fontSize: 12,
        height: 1.4,
        color: muted,
      ),
    );
  }

  static final TextTheme lightTheme = generateTextTheme(
    text: CUThemeColors.lightText,
    muted: CUThemeColors.lightTextMuted,
  );

  static final TextTheme darkTheme = generateTextTheme(
    text: CUThemeColors.darkText,
    muted: CUThemeColors.darkTextMuted,
  );
}
