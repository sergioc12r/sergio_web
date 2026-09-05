import 'package:flutter/material.dart';
import 'package:sergio_web/common/data/utils_urls.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/utils/url_luncher_module.dart';
import 'package:sergio_web/common/widgets/cu_text_link.dart';

/// Social links in the footer, as a wrapping row of mono text links.
///
/// The SVG marks are gone here for the same reason they are gone in the
/// contact section: at footer scale a name is more legible than a glyph, and
/// it keeps the whole footer to one typographic register.
class FlutterSocialMedia extends StatelessWidget {
  const FlutterSocialMedia({super.key});

  static const List<({String label, String url})> _networks =
      <({String label, String url})>[
        (label: 'LinkedIn', url: UtilsUrls.linkedinUrl),
        (label: 'GitHub', url: UtilsUrls.githubUrl),
        (label: 'Instagram', url: UtilsUrls.instagramUrl),
      ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: CUSpacing.s24,
      runSpacing: CUSpacing.s4,
      children: <Widget>[
        for (final ({String label, String url}) network in _networks)
          CUTextLink(
            label: network.label,
            style: CUTextStyles.monoTag,
            onTap: () => UrlLauncherModule.launchSimpleUrl(network.url),
          ),
      ],
    );
  }
}
