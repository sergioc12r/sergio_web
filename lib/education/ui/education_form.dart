import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/widgets/cu_section_header.dart';
import 'package:sergio_web/education/models/education.dart';
import 'package:sergio_web/education/ui/education_item_widget.dart';
import 'package:sergio_web/l10n/app_localizations.dart';
import 'package:sergio_web/providers/providers.dart';

/// Section 04. Same construction as section 03 — see [EducationItemWidget].
class EducationForm extends ConsumerWidget {
  const EducationForm({super.key, required this.index});

  final String index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Education> list = ref.watch(educationProvider);
    final strings = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CUSectionHeader(
          index: index,
          title: strings.education_title,
          subtitle: strings.education_subtitle,
        ),
        const SizedBox(height: CUSpacing.s24),
        for (final Education item in list) EducationItemWidget(education: item),
        Divider(color: colors.outline),
      ],
    );
  }
}
