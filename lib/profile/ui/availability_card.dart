import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/l10n/app_localizations.dart';

/// "Available for projects", as one quiet mono line.
///
/// It was a glass card with a green dot — a badge competing with the H1 for
/// attention. It is now a status line: a small accent square as the only
/// marker, then the text. It sits above the headline the way a dateline sits
/// above a story.
class AvailabilityCard extends StatelessWidget {
  const AvailabilityCard({super.key});

  static const double _markerSize = 6;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final strings = AppLocalizations.of(context)!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox.square(
          dimension: _markerSize,
          child: ColoredBox(color: colors.primary),
        ),
        const SizedBox(width: CUSpacing.s8),
        Flexible(
          child: Text(
            strings.profile_availability.toUpperCase(),
            style: CUTextStyles.monoLabel.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
