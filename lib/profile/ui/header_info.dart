import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/widgets/cu_text_link.dart';
import 'package:sergio_web/l10n/app_localizations.dart';
import 'package:sergio_web/profile/ui/availability_card.dart';

/// The written half of the hero.
///
/// One dominant element: the name, set at 44px. Everything above and below it
/// is support — a mono eyebrow for the role, one paragraph, the location as
/// metadata, and a single underlined link out. No button, no gradient, and
/// the second half of the name is no longer painted a different color.
class HeaderInfo extends StatelessWidget {
  const HeaderInfo({super.key, required this.scrollToContact});

  final VoidCallback scrollToContact;

  /// Long-form copy stops being readable past roughly this measure.
  static const double _paragraphMeasure = 560;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final text = theme.textTheme;
    final strings = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const AvailabilityCard(),
        const SizedBox(height: CUSpacing.s24),
        Text(
          strings.profile_subtitle.toUpperCase(),
          style: CUTextStyles.monoLabel.copyWith(color: colors.primary),
        ),
        const SizedBox(height: CUSpacing.s16),
        Text(
          '${strings.profile_title_one}${strings.profile_title_two}',
          style: text.displaySmall,
        ),
        const SizedBox(height: CUSpacing.s24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _paragraphMeasure),
          child: Text(strings.profile_description, style: text.bodyLarge),
        ),
        const SizedBox(height: CUSpacing.s20),
        Text(
          strings.location.toUpperCase(),
          style: CUTextStyles.monoMeta.copyWith(color: colors.onSurfaceVariant),
        ),
        const SizedBox(height: CUSpacing.s16),
        CUTextLink(
          label: strings.profile_button,
          trailing: '↓',
          onTap: scrollToContact,
          style: CUTextStyles.monoLabel,
        ),
      ],
    );
  }
}
