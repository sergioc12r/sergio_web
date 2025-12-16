import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/common/widgets/cu_title.dart';
import 'package:sergio_web/education/ui/education_item_widget.dart';
import 'package:sergio_web/providers/providers.dart';

class EducationForm extends ConsumerWidget {
  const EducationForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(educationProvider);
    final strings = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        CUTitle(
          title: strings.education_title,
        ),
        const SizedBox(height: 20),
        Text(
          strings.education_subtitle,
          style: textTheme.bodySmall,
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          direction: Axis.horizontal,
          children: List.generate(list.length, (index) {
            return EducationItemWidget(education: list[index]);
          }),
        )
      ],
    );
  }
}
