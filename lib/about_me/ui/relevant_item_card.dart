import 'package:flutter/material.dart';
import 'package:sergio_web/about_me/model/about_me_model.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';

/// One cell of the statistics row.
///
/// It was a card: gradient icon tile, title, subtitle, drop shadow — the
/// icon+number+label pattern this redesign exists to remove. It is now a cell
/// in a ruled row: the figure in large mono, the label in small mono beneath
/// it, and a single vertical hairline dividing it from its neighbour. The
/// `iconUrl` on the model is intentionally ignored.
class RelevantItemCard extends StatelessWidget {
  const RelevantItemCard({
    super.key,
    required this.item,
    required this.showLeadingRule,
  });

  final RelevantItemModel item;

  /// The first cell in a row has no rule to its left.
  final bool showLeadingRule;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: showLeadingRule ? CUSpacing.hairline : 0,
            color: showLeadingRule ? colors.outline : Colors.transparent,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CUSpacing.s20,
          vertical: CUSpacing.s8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              item.title,
              style: CUTextStyles.monoStat.copyWith(color: colors.onSurface),
            ),
            const SizedBox(height: CUSpacing.s8),
            Text(
              item.subTitle.toUpperCase(),
              style: CUTextStyles.monoLabel.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
