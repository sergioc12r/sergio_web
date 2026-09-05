import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/widgets/cu_title.dart';

/// The masthead of every numbered section: a mono index ("01", "02"…) sitting
/// above the H2, separated from the content by a hairline.
///
/// The number is the only place in a section header where accent is allowed,
/// and only on hover — it rewards pointing at the section without shouting on
/// first paint.
class CUSectionHeader extends StatefulWidget {
  const CUSectionHeader({
    super.key,
    required this.index,
    required this.title,
    this.subtitle,
  });

  /// Already formatted, e.g. "01".
  final String index;
  final String title;
  final String? subtitle;

  @override
  State<CUSectionHeader> createState() => _CUSectionHeaderState();
}

class _CUSectionHeaderState extends State<CUSectionHeader> {
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
    final text = theme.textTheme;

    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AnimatedDefaultTextStyle(
            duration: _feedback,
            curve: Curves.easeOutCubic,
            style: CUTextStyles.monoSectionNumber.copyWith(
              color: _hovering ? colors.primary : colors.onSurfaceVariant,
            ),
            child: Text(widget.index),
          ),
          const SizedBox(height: CUSpacing.s12),
          CUTitle(title: widget.title),
          if (widget.subtitle != null) ...<Widget>[
            const SizedBox(height: CUSpacing.s8),
            Text(widget.subtitle!, style: text.bodyLarge),
          ],
          const SizedBox(height: CUSpacing.s24),
          Divider(color: colors.outline),
        ],
      ),
    );
  }
}
