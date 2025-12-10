import 'package:flutter/material.dart';
import 'package:sergio_web/common/icons/cu_icons.dart';
import 'package:sergio_web/common/social_media/social_media_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlutterSocialMedia extends StatelessWidget {
  const FlutterSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final style = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(strings.footer_social_title, style: style.bodySmall),
        Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          runSpacing: 10,
          children: [
            SocialMediaItem(path: CUIcons.linkedin, size: 20),
            SocialMediaItem(path: CUIcons.instagram, size: 20),
            SocialMediaItem(path: CUIcons.github, size: 20),
          ],
        ),
      ],
    );
  }
}
