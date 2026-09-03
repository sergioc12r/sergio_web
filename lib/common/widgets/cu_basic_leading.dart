import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';

/// A labelled value in a ruled list — the row shape the contact section is
/// built from.
///
/// It was a glass card with a gradient icon tile. It is now a mono uppercase
/// label with the value under it and a hairline below, so a stack of these
/// reads as one table instead of a pile of floating cards. The icon argument
/// is gone: the label already says what the value is.
class CuBasicLeading extends StatefulWidget {
  const CuBasicLeading({
    super.key,
    required this.title,
    required this.label,
    this.onTap,
  });

  /// The mono uppercase caption, e.g. "EMAIL".
  final String title;

  /// The value itself.
  final String label;

  final VoidCallback? onTap;

  @override
  State<CuBasicLeading> createState() => _CuBasicLeadingState();
}

class _CuBasicLeadingState extends State<CuBasicLeading> {
  bool _hovering = false;

  static const Duration _feedback = Duration(milliseconds: 150);

  void _setHover(bool value) {
    if (_hovering == value) return;
    setState(() => _hovering = value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final bool interactive = widget.onTap != null;
    final Color ink = interactive && _hovering
        ? colors.primary
        : colors.onSurface;

    final Widget row = ConstrainedBox(
      constraints: const BoxConstraints(minHeight: CUSizing.minTapTarget),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: CUSpacing.s12),
          Text(
            widget.title.toUpperCase(),
            style: CUTextStyles.monoLabel.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: CUSpacing.s4),
          AnimatedDefaultTextStyle(
            duration: _feedback,
            curve: Curves.easeOutCubic,
            style: theme.textTheme.titleSmall!.copyWith(color: ink),
            child: Text(widget.label),
          ),
          const SizedBox(height: CUSpacing.s12),
          Divider(color: colors.outline),
        ],
      ),
    );

    if (!interactive) {
      return row;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: Semantics(button: true, child: row),
      ),
    );
  }
}
