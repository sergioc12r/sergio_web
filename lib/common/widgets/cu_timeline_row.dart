import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_breakpoints.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';

/// One entry of a chronological list.
///
/// Both "experience" and "education" are the same object — a dated thing that
/// happened somewhere — so they share this row rather than each inventing a
/// card. The date sits in a fixed mono column on the left and the content
/// takes the rest; a rule on top separates entries. No dots, no connecting
/// line, no company logos: the alignment of the date column already reads as
/// a timeline.
class CUTimelineRow extends StatelessWidget {
  const CUTimelineRow({
    super.key,
    required this.date,
    required this.child,
    this.badge,
  });

  final String date;
  final Widget child;

  /// The one accent-colored mark allowed in these sections — used for the
  /// "current position" flag.
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final Widget dateBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          date.toUpperCase(),
          style: CUTextStyles.monoMeta.copyWith(color: colors.onSurfaceVariant),
        ),
        if (badge != null) ...<Widget>[
          const SizedBox(height: CUSpacing.s4),
          Text(
            badge!.toUpperCase(),
            style: CUTextStyles.monoLabel.copyWith(color: colors.primary),
          ),
        ],
      ],
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: CUSpacing.hairline, color: colors.outline),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CUSpacing.s32),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (CUBreakpoints.isCompact(constraints.maxWidth)) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  dateBlock,
                  const SizedBox(height: CUSpacing.s16),
                  child,
                ],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: CUSizing.timelineDateColumn, child: dateBlock),
                const SizedBox(width: CUSpacing.s40),
                Expanded(child: child),
              ],
            );
          },
        ),
      ),
    );
  }
}
