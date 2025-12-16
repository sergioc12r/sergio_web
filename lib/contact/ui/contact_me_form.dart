import 'package:flutter/material.dart';
import 'package:sergio_web/contact/ui/contact_me_info.dart';
import 'package:sergio_web/contact/ui/contact_me_social.dart';
import 'package:sergio_web/contact/ui/send_me_message_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactMeForm extends StatelessWidget {
  const ContactMeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final strings = AppLocalizations.of(context)!;

    return LayoutBuilder(builder: (context, constraints) {
      final availableWidth = constraints.maxWidth;
      const spacing = 15.0;
      final itemWidth = (availableWidth - spacing * 3) / 2;
      final finalWidth =
          itemWidth < 300 ? availableWidth - 2 * spacing : itemWidth;

      return Column(
        spacing: 20,
        children: [
          Text(strings.contact_title, style: textStyle.headlineMedium),
          Text(strings.contact_sub_title, style: textStyle.bodySmall),
          Wrap(
            spacing: spacing,
            runSpacing: spacing,
            direction: Axis.horizontal,
            children: [
              SizedBox(
                width: finalWidth,
                child: Column(
                  spacing: 15,
                  children: [
                    ContactMeInfo(),
                    ContactMeSocial(),
                  ],
                ),
              ),
              SizedBox(width: finalWidth, child: SendMeMessageForm()),
            ],
          ),
        ],
      );
    });
  }
}
