import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/widgets/cu_section_header.dart';
import 'package:sergio_web/contact/ui/contact_me_info.dart';
import 'package:sergio_web/contact/ui/contact_me_social.dart';
import 'package:sergio_web/l10n/app_localizations.dart';

/// Section 05.
///
/// Just the ways to reach him — email, location, socials — as a single
/// ruled reference list. No form.
class ContactMeForm extends StatelessWidget {
  const ContactMeForm({super.key, required this.index});

  final String index;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CUSectionHeader(
          index: index,
          title: strings.contact_title,
          subtitle: strings.contact_sub_title,
        ),
        const SizedBox(height: CUSpacing.s40),
        const ContactMeInfo(),
        const SizedBox(height: CUSpacing.s32),
        const ContactMeSocial(),
      ],
    );
  }
}
