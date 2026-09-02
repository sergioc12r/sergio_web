import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/experience/model/experience_model.dart';

/// Skills for one role, as a single mono line.
///
/// Was a [Wrap] of chips. Set as running text separated by middots, a long
/// list stops looking like a UI control and starts looking like a caption —
/// which is all it ever was. `svgUrl` on the model is intentionally unused.
class ExperienceSkillsWidget extends StatelessWidget {
  const ExperienceSkillsWidget({super.key, this.skills});

  final List<ExperienceSkillModel>? skills;

  static const String _separator = '  ·  ';

  @override
  Widget build(BuildContext context) {
    final List<ExperienceSkillModel>? items = skills;
    if (items == null || items.isEmpty) {
      return const SizedBox.shrink();
    }

    final colors = Theme.of(context).colorScheme;

    return Text(
      items.map((ExperienceSkillModel s) => s.title).join(_separator),
      style: CUTextStyles.monoTag.copyWith(color: colors.onSurfaceVariant),
    );
  }
}
