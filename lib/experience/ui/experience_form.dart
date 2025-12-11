import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/common/helpers/date_time_helper.dart';
import 'package:sergio_web/experience/ui/item/experience_item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sergio_web/providers/providers.dart';

class ExperienceForm extends ConsumerWidget {
  const ExperienceForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final experiences = ref.watch(experienceProvider);
    return Column(
      children: [
        Text(
          local.experience_title,
          style: textTheme.headlineMedium,
        ),
        const SizedBox(height: 10),
        Text(
          local.experience_subtitle,
          style: textTheme.titleMedium,
        ),
        const SizedBox(height: 60),
        ListView.builder(
            itemCount: experiences.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = experiences.elementAt(index);
              return ExperienceItemWidget(
                title: item.title,
                company: item.company,
                description: item.description,
                isCurrent: item.isCurrent,
                initDate:
                    item.initDate.toLocalizedDate(locale: local.localeName),
                endDate: item.endDate.toLocalizedDate(locale: local.localeName),
                isLast: index == experiences.length - 1,
                skills: item.skills,
                activities: item.activities,
              );
            }),
      ],
    );
  }
}
