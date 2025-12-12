import 'package:flutter/material.dart';
import 'package:sergio_web/common/data/utils_urls.dart';
import 'package:sergio_web/profile/ui/profile_kpi_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(alignment: Alignment.center, children: [
            SizedBox(width: constraints.maxWidth * 0.4),
            Container(
              width: constraints.maxWidth * 0.18,
              height: constraints.maxWidth * 0.18,
              constraints: BoxConstraints(
                  maxWidth: 1700,
                  maxHeight: 1700,
                  minWidth: 400,
                  minHeight: 400),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withAlpha(25),
              ),
            ),
            Container(
              width: constraints.maxWidth * 0.15,
              height: constraints.maxWidth * 0.15,
              constraints: BoxConstraints(
                  maxWidth: 1600,
                  maxHeight: 1600,
                  minWidth: 300,
                  minHeight: 300),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(UtilsUrls.profileImage),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: ProfileKpiCard(
                icon: Icons.mobile_friendly_outlined,
                text: strings.profile_experience_title,
                subText: strings.profile_experience_subtitle,
              ),
            ),
          ]),
        ],
      );
    });
  }
}
