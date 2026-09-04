import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_breakpoints.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/footer/ui/footer_contact_us.dart';
import 'package:sergio_web/footer/ui/footer_location.dart';
import 'package:sergio_web/footer/ui/footer_social_media.dart';
import 'package:sergio_web/l10n/app_localizations.dart';

/// The colophon.
///
/// The design system asked for a single quiet mono line, but the footer also
/// carries the only copy of some links, so they survive as one row of text
/// links above the line rather than being deleted. Background is `bg`, not
/// `bgAlt` — the page ends on a rule, it does not end on a slab.
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final strings = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isCompact = CUBreakpoints.isCompact(constraints.maxWidth);

        return DecoratedBox(
          decoration: BoxDecoration(
            color: colors.surface,
            border: Border(
              top: BorderSide(width: CUSpacing.hairline, color: colors.outline),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isCompact
                  ? CUSpacing.sectionHorizontalMobile
                  : CUSpacing.sectionHorizontalDesktop,
              vertical: CUSpacing.s40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  strings.footer_title.toUpperCase(),
                  style: CUTextStyles.monoLabel.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: CUSpacing.s16),
                Wrap(
                  spacing: CUSpacing.s24,
                  runSpacing: CUSpacing.s4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const <Widget>[
                    FooterContactUs(),
                    FlutterSocialMedia(),
                  ],
                ),
                const SizedBox(height: CUSpacing.s16),
                const FooterLocation(),
                const SizedBox(height: CUSpacing.s32),
                Divider(color: colors.outline),
                const SizedBox(height: CUSpacing.s16),
                Text(
                  strings.footer_final_text,
                  style: CUTextStyles.monoMeta.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
