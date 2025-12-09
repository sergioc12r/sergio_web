import 'package:flutter/material.dart';
import 'package:sergio_web/common/icons/cu_icons.dart';
import 'package:sergio_web/common/social_media/social_media_item.dart';

class FlutterSocialMedia extends StatelessWidget {
  const FlutterSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Follow me:'),
        const SizedBox(height: 10),
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
