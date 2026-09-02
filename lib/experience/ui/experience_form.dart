import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/common/helpers/date_time_helper.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/widgets/cu_section_header.dart';
import 'package:sergio_web/experience/model/experience_model.dart';
import 'package:sergio_web/experience/ui/item/experience_item_widget.dart';
import 'package:sergio_web/l10n/app_localizations.dart';
import 'package:sergio_web/providers/providers.dart';

/// Section 03.
class ExperienceForm extends ConsumerWidget {
  const ExperienceForm({super.key, required this.index});

  final String index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context)!;
    final List<ExperienceModel> experiences = ref.watch(experienceProvider);
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CUSectionHeader(
          index: index,
          title: strings.experience_title,
          subtitle: strings.experience_subtitle,
        ),
        const SizedBox(height: CUSpacing.s24),

        /// Never a scrollable inside the page scrollable: this list is short,
        /// fully known, and lives inside a [CustomScrollView].
        for (final ExperienceModel item in experiences)
          ExperienceItemWidget(
            title: item.title,
            company: item.company,
            description: item.description,
            isCurrent: item.isCurrent,
            initDate: item.initDate.toLocalizedDate(
              locale: strings.localeName,
            ),
            endDate: item.endDate.toLocalizedDate(locale: strings.localeName),
            skills: item.skills,
            activities: item.activities,
          ),

        /// Closes the list so the last entry is bounded like the others.
        Divider(color: colors.outline),
      ],
    );
  }
}
