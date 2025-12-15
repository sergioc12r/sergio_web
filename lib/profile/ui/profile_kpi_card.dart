import 'package:flutter/material.dart';

class ProfileKpiCard extends StatelessWidget {
  const ProfileKpiCard(
      {super.key,
      required this.icon,
      required this.text,
      required this.subText});

  final IconData icon;
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colorStyle = Theme.of(context).iconTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 20, color: colorStyle.color),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: textStyle.bodyMedium,
                ),
                Text(
                  subText,
                  style: textStyle.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
