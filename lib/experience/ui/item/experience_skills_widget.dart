import 'package:flutter/material.dart';
import 'package:sergio_web/common/widgets/cu_chip.dart';
import 'package:sergio_web/experience/model/experience_model.dart';

/// Chip list to show in [ExperienceItemWidget]
class ExperienceSkillsWidget extends StatelessWidget {
  const ExperienceSkillsWidget({super.key, this.skills});

  final List<ExperienceSkillModel>? skills;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(skills?.length ?? 0, (index) {
        var skill = skills?.elementAt(index);
        return CUChip(text: skill?.title ?? '', svgUrl: skill?.svgUrl);
      }),
    );
  }
}
