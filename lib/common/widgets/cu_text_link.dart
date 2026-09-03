import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';

/// The only "call to action" this design has.
///
/// Every action on the page — scroll to a section, open a profile, submit the
/// contact form — is an underlined line of text. It is at rest in the normal
/// ink and moves to the accent on hover, which is where the underline
/// thickens too. No fill, no radius, no elevation.
class CUTextLink extends StatefulWidget {
  const CUTextLink({
    super.key,
    required this.label,
    required this.onTap,
    this.style,
    this.trailing,
  });

  final String label;
  final VoidCallback onTap;

  /// Defaults to `textTheme.labelLarge`. Pass `CUTextStyles.mono*` where the
  /// link belongs to a machine-ish register (nav, footer).
  final TextStyle? style;

  /// Rendered after the label, inside the underline. Used for the "↓" of the
  /// hero link.
  final String? trailing;

  @override
  State<CUTextLink> createState() => _CUTextLinkState();
}

class _CUTextLinkState extends State<CUTextLink> {
  bool _hovering = false;

  static const Duration _feedback = Duration(milliseconds: 150);
  static const double _restingUnderline = 1.0;
  static const double _hoverUnderline = 1.6;

  void _setHover(bool value) {
    if (_hovering == value) return;
    setState(() => _hovering = value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final TextStyle base = widget.style ?? theme.textTheme.labelLarge!;
    final Color ink = _hovering ? colors.primary : colors.onSurface;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: Semantics(
        link: true,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: CUSizing.minTapTarget,
            ),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              widthFactor: 1,
              child: AnimatedDefaultTextStyle(
                duration: _feedback,
                curve: Curves.easeOutCubic,
                style: base.copyWith(
                  color: ink,
                  decoration: TextDecoration.underline,
                  decorationColor: ink,
                  decorationThickness: _hovering
                      ? _hoverUnderline
                      : _restingUnderline,
                ),
                child: Text(
                  widget.trailing == null
                      ? widget.label
                      : '${widget.label}  ${widget.trailing}',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
