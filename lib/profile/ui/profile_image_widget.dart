import 'package:flutter/material.dart';
import 'package:sergio_web/common/data/utils_urls.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/widgets/cu_framed_image.dart';
import 'package:sergio_web/l10n/app_localizations.dart';

/// The pictorial half of the hero: a framed portrait with the years-of-
/// experience figure set underneath it.
///
/// The circular avatar with its blue halo and the floating KPI card are gone.
/// A rectangle reads as a printed portrait, and the figure below it is the
/// same stat treatment used in the "about" section — one system, not two.
class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  /// Slightly taller than wide, like a passport frame.
  static const double _portraitRatio = 4 / 5;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final strings = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CUFramedImage(
          url: UtilsUrls.profileImage,
          placeholderLabel: strings.profile_title_two,
          aspectRatio: _portraitRatio,
        ),
        const SizedBox(height: CUSpacing.s20),
        Text(
          strings.profile_experience_title,
          style: CUTextStyles.monoStat.copyWith(color: colors.onSurface),
        ),
        const SizedBox(height: CUSpacing.s4),
        Text(
          strings.profile_experience_subtitle.toUpperCase(),
          style: CUTextStyles.monoLabel.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
