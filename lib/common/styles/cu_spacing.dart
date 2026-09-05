/// Layout tokens. Never write a raw spacing number in a widget file.
class CUSpacing {
  const CUSpacing._();

  /// Rhythm between top-level page sections.
  static const double sectionVertical = 92;
  static const double sectionHorizontalDesktop = 48;
  static const double sectionHorizontalMobile = 20;

  /// Space between columns / cells inside a section.
  static const double gutter = 24;

  /// Every rule, divider and border in the system is exactly this thick.
  static const double hairline = 1.0;

  /// Corner radius. 0 is the default; 2 is the only exception, for elements
  /// that need to read as "pressable" (the theme toggle pill).
  static const double radius = 2.0;

  /// Micro scale, in the order it should be reached for.
  static const double s4 = 4;
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s20 = 20;
  static const double s24 = 24;
  static const double s32 = 32;
  static const double s40 = 40;
  static const double s48 = 48;
  static const double s64 = 64;
}

/// Fixed sizes that repeat across widgets.
class CUSizing {
  const CUSizing._();

  /// Minimum hit target for anything tappable.
  static const double minTapTarget = 48;

  /// Nav bar height.
  static const double toolbarHeight = 64;

  /// Narrow column of the asymmetric "about" layout.
  static const double narrowColumn = 280;

  /// Readable measure for long-form body copy.
  static const double maxContentWidth = 1120;

  /// Column reserved for dates in the timeline sections.
  static const double timelineDateColumn = 160;

  /// Social / inline icon size.
  static const double icon = 20;

  /// Diagonal stripe pitch of [CUStripedPlaceholder], in logical pixels.
  static const double stripeStep = 10;
}
