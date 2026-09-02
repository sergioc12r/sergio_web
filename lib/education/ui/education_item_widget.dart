import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/widgets/cu_timeline_row.dart';
import 'package:sergio_web/education/models/education.dart';

/// One qualification.
///
/// This section used to be a wrapped grid of glass cards with gradient icon
/// tiles — a completely different object from the experience list next to it,
/// despite holding the same kind of information. It now uses the very same
/// [CUTimelineRow], so the two sections read as one continuous record.
class EducationItemWidget extends StatelessWidget {
  const EducationItemWidget({super.key, required this.education});

  final Education education;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return CUTimelineRow(
      date: education.finishDate.year.toString(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(education.title, style: theme.textTheme.titleLarge),
          const SizedBox(height: CUSpacing.s4),
          Text(
            education.place.toUpperCase(),
            style: CUTextStyles.monoLabel.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          if (education.description.isNotEmpty) ...<Widget>[
            const SizedBox(height: CUSpacing.s16),
            Text(education.description, style: theme.textTheme.bodyMedium),
          ],
        ],
      ),
    );
  }
}
