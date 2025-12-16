import 'package:flutter/material.dart';
import 'package:sergio_web/common/data/utils_urls.dart';
import 'package:sergio_web/common/icons/cu_icons.dart';
import 'package:sergio_web/common/social_media/social_media_item.dart';
import 'package:sergio_web/common/widgets/glass_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactMeSocial extends StatelessWidget {
  const ContactMeSocial({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final strings = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 15,
      children: [
        Text(
          strings.contact_social_title,
          style: textStyle.titleMedium,
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 15,
          runSpacing: 15,
          children: [
            GlassCard(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SocialMediaItem(
                path: CUIcons.linkedin,
                size: 20,
                color: Colors.blueAccent,
                url: UtilsUrls.linkedin,
              ),
            )),
            GlassCard(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SocialMediaItem(
                path: CUIcons.instagram,
                size: 20,
                color: Colors.blueAccent,
                url: UtilsUrls.instagram,
              ),
            )),
            GlassCard(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SocialMediaItem(
                path: CUIcons.github,
                size: 20,
                color: Colors.blueAccent,
                url: UtilsUrls.github,
              ),
            )),
          ],
        )
      ],
    );
  }
}
