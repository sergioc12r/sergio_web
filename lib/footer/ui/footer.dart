import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sergio_web/footer/ui/footer_contact_us.dart';
import 'package:sergio_web/footer/ui/footer_location.dart';
import 'package:sergio_web/footer/ui/footer_social_media.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).cardColor;
    final strings = AppLocalizations.of(context)!;
    final style = Theme.of(context).textTheme;
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              const SizedBox(height: 20),
              Text(strings.footer_title, style: style.headlineSmall),
              FooterContactUs(),
              FlutterSocialMedia(),
              FooterLocation(),
              const Divider(),
              Text(strings.footer_final_text, style: style.bodySmall),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    });
  }
}
