import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sergio_web/common/data/utils_urls.dart';
import 'package:sergio_web/common/icons/cu_icons.dart';
import 'package:sergio_web/common/social_media/social_media_item.dart';
import 'package:sergio_web/common/widgets/cu_gradient_button.dart';
import 'package:sergio_web/common/widgets/glass_card.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({super.key, required this.scrollToContact});

  final Function() scrollToContact;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colorsStyle = Theme.of(context).colorScheme;
    final strings = AppLocalizations.of(context)!;
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: textStyle.headlineLarge,
                children: <TextSpan>[
                  TextSpan(text: strings.profile_title_one),
                  TextSpan(
                    text: strings.profile_title_two,
                    style: textStyle.headlineLarge!.copyWith(
                      color: colorsStyle.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              strings.profile_subtitle,
              style: textStyle.titleLarge?.copyWith(
                color: colorsStyle.primary,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              strings.profile_description,
              style: textStyle.bodyLarge,
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.grey, size: 18),
                SizedBox(width: 8),
                Text(
                  strings.location,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CUGradientButton(
                callback: () {
                  scrollToContact();
                },
                title: strings.profile_button),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
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
        ),
      );
    });
  }
}
