import 'package:flutter/material.dart';
import 'package:sergio_web/common/widgets/glass_card.dart';
import 'package:sergio_web/experience/model/experience_model.dart';
import 'package:sergio_web/experience/ui/item/experience_activity_widget.dart';
import 'package:sergio_web/experience/ui/item/experience_skills_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExperienceItemWidget extends StatelessWidget {
  const ExperienceItemWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.company,
      required this.initDate,
      required this.endDate,
      required this.isCurrent,
      required this.isLast,
      this.skills,
      this.activities});

  final String title;
  final String description;
  final String company;
  final String initDate;
  final String endDate;
  final bool isCurrent;
  final bool isLast;
  final List<ExperienceSkillModel>? skills;
  final List<ExperienceActivitiesModel>? activities;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).textTheme;
    final strings = AppLocalizations.of(context)!;
    return LayoutBuilder(builder: (context, constraints) {
      return IntrinsicHeight(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.blue,
                                width: 4.0,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: 2, // Ancho de la línea
                            color: isLast
                                ? Colors.transparent
                                : Colors.grey.shade300, // Color de la línea
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text(
                        '$initDate - ${isCurrent ? strings.experience_current : endDate}',
                        style: styles.titleMedium,
                      ),
                      GlassCard(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    spacing: 11,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        title,
                                        style: styles.headlineSmall,
                                      ),
                                      Text(company, style: styles.titleMedium),
                                      Text(description,
                                          style: styles.bodyMedium),
                                      ExperienceActivityWidget(
                                          activities: activities),
                                      ExperienceSkillsWidget(skills: skills),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
