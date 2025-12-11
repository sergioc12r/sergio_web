import 'package:flutter/material.dart';
import 'package:sergio_web/common/widgets/cu_icon_container.dart';
import 'package:sergio_web/common/widgets/glass_card.dart';
import 'package:sergio_web/education/models/education.dart';
import 'package:sergio_web/education/ui/education_date_widget.dart';

class EducationItemWidget extends StatelessWidget {
  const EducationItemWidget({super.key, required this.education});

  final Education education;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    final itemWidth = (screenWidth - 40 * 3) / 2;
    return SizedBox(
      width: itemWidth < 300 ? screenWidth : itemWidth,
      child: GlassCard(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CuIconContainer(
              iconData: education.iconData,
              gradient: education.isDegree
                  ? null
                  : LinearGradient(colors: [
                      Color(0x3D99A7F6),
                      Color(0x3D99A7F6),
                    ]),
              iconColor: education.isDegree ? null : Colors.blue,
            ),
            const SizedBox(width: 30),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  EducationDateWidget(
                      text: education.finishDate.year.toString()),
                  Text(education.title, style: textTheme.titleMedium),
                  Text(education.place, style: textTheme.bodyMedium),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
