import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/experience/model/experience_model.dart';

/// What was actually done in a role.
///
/// The green check icon on every line is gone: nineteen checkmarks down a
/// page is nineteen pieces of visual noise that all say the same thing. A
/// mono en-dash in the margin marks the item and lets the text set flush.
class ExperienceActivityWidget extends StatelessWidget {
  const ExperienceActivityWidget({super.key, this.activities});

  final List<ExperienceActivitiesModel>? activities;

  static const String _marker = '—';
  static const double _markerColumn = 24;

  @override
  Widget build(BuildContext context) {
    final List<ExperienceActivitiesModel>? items = activities;
    if (items == null || items.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (final ExperienceActivitiesModel item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: CUSpacing.s8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: _markerColumn,
                  child: Text(
                    _marker,
                    style: CUTextStyles.monoMeta.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(item.body, style: theme.textTheme.bodyMedium),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
