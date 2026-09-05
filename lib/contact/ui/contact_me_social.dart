import 'package:flutter/material.dart';
import 'package:sergio_web/common/data/utils_urls.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/utils/url_luncher_module.dart';
import 'package:sergio_web/common/widgets/cu_text_link.dart';
import 'package:sergio_web/l10n/app_localizations.dart';

/// Where else to find him.
///
/// Three glass cards holding three blue SVG marks became three underlined
/// text links in a ruled list — the same row shape as the email and location
/// above them, so the whole left column reads as one table.
class ContactMeSocial extends StatelessWidget {
  const ContactMeSocial({super.key});

  /// Network names are proper nouns, not translated copy — they are the same
  /// string in every locale, which is why they are not in the ARB.
  static const List<({String label, String url})> _networks =
      <({String label, String url})>[
        (label: 'LinkedIn', url: UtilsUrls.linkedinUrl),
        (label: 'GitHub', url: UtilsUrls.githubUrl),
        (label: 'Instagram', url: UtilsUrls.instagramUrl),
      ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final strings = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          strings.contact_social_title.toUpperCase(),
          style: CUTextStyles.monoLabel.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: CUSpacing.s8),
        for (final ({String label, String url}) network
            in _networks) ...<Widget>[
          CUTextLink(
            label: network.label,
            style: CUTextStyles.monoTag,
            onTap: () => UrlLauncherModule.launchSimpleUrl(network.url),
          ),
          Divider(color: colors.outline),
        ],
      ],
    );
  }
}
