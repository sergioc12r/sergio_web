import 'package:flutter/material.dart';
import 'package:sergio_web/experience/model/experience_model.dart';

class ExperienceActivityWidget extends StatelessWidget {
  const ExperienceActivityWidget({super.key, this.activities});

  final List<ExperienceActivitiesModel>? activities;

  @override
  Widget build(BuildContext context) {
    if (activities == null || activities!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: activities!.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 5,
            children: [
              const Icon(Icons.check, color: Colors.lightGreen),
              Flexible(
                child: Text(
                  item.body,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
