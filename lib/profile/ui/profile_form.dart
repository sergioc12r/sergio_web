import 'package:flutter/material.dart';
import 'package:sergio_web/profile/ui/profile_info_part.dart';

import 'profile_image_widget.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key, required this.scrollToContact});

  final Function() scrollToContact;

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context,constraints) {
        final availableWidth = constraints.maxWidth;
        const spacing = 25.0;
        final itemWidth = (availableWidth - spacing * 3) / 2;
        final finalWidth =
        itemWidth < 450 ? availableWidth - 2 * spacing : itemWidth;
        return Wrap(
          runSpacing: spacing,
          spacing: spacing,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            SizedBox(
                width: finalWidth,
                child: ProfileInfoPart(scrollToContact: scrollToContact)),
            const ProfileImageWidget(),
          ],
        );
      }
    );
  }
}
