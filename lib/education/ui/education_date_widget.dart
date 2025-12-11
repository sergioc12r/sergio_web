import 'package:flutter/material.dart';

/// Widget shows calendar icon and label after these
/// to show the date of the education finished
class EducationDateWidget extends StatelessWidget {
  const EducationDateWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    return Row(
      children: [
        Icon(
          Icons.calendar_today_outlined,
          color: texts.labelMedium!.color,
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: texts.labelMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
