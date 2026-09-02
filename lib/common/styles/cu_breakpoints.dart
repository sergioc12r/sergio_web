/// Single source of truth for layout breakpoints.
///
/// Replaces the magic number `800` that used to be repeated in
/// `home_screen.dart`, `about_me_form.dart` and `cu_app_bar.dart`.
class CUBreakpoints {
  const CUBreakpoints._();

  /// Below this the layout collapses to a single column and the nav
  /// becomes a drawer.
  static const double compact = 600;

  /// Above this the layout gets its full desktop gutters.
  static const double expanded = 1024;

  static bool isCompact(double width) => width < compact;

  static bool isExpanded(double width) => width >= expanded;
}
