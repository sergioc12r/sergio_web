import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/widgets/cu_timeline_row.dart';
import 'package:sergio_web/experience/model/experience_model.dart';
import 'package:sergio_web/experience/ui/item/experience_activity_widget.dart';
import 'package:sergio_web/experience/ui/item/experience_skills_widget.dart';
import 'package:sergio_web/l10n/app_localizations.dart';

/// One job.
///
/// The bullet-and-connector rail plus the glass card are gone; this is a row
/// in a ruled list. `isLast` is no longer needed — with a top rule per entry
/// there is no trailing line to suppress.
class ExperienceItemWidget extends StatelessWidget {
  const ExperienceItemWidget({
    super.key,
    required this.title,
    required this.description,
    required this.company,
    required this.initDate,
    required this.endDate,
    required this.isCurrent,
    this.skills,
    this.activities,
  });

  final String title;
  final String description;
  final String company;
  final String initDate;
  final String endDate;
  final bool isCurrent;
  final List<ExperienceSkillModel>? skills;
  final List<ExperienceActivitiesModel>? activities;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final strings = AppLocalizations.of(context)!;

    return CUTimelineRow(
      /// An open-ended range reads as ongoing on its own; the accent badge
      /// below says so in words, so the end of the range stays blank rather
      /// than repeating the label twice.
      date: isCurrent ? '$initDate —' : '$initDate — $endDate',
      badge: isCurrent ? strings.experience_current : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(title, style: theme.textTheme.titleLarge),
          const SizedBox(height: CUSpacing.s4),
          Text(
            company.toUpperCase(),
            style: CUTextStyles.monoLabel.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: CUSpacing.s16),
          Text(description, style: theme.textTheme.bodyMedium),
          const SizedBox(height: CUSpacing.s16),
          ExperienceActivityWidget(activities: activities),
          const SizedBox(height: CUSpacing.s12),
          ExperienceSkillsWidget(skills: skills),
        ],
      ),
    );
  }
}
