import 'package:flutter/material.dart';
import 'package:sergio_web/common/widgets/glass_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AvailabilityCard extends StatelessWidget {
  const AvailabilityCard({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final textStyle = Theme.of(context).textTheme;
    return GlassCard(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            spacing: 10,
            children: [
              const CircleAvatar(
                radius: 4,
                backgroundColor: Colors.green,
              ),
              Text(strings.profile_availability, style: textStyle.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
