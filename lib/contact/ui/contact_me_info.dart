import 'package:flutter/material.dart';
import 'package:sergio_web/common/widgets/cu_basic_leading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactMeInfo extends StatelessWidget {
  const ContactMeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 40) / 2;
    final strings = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Text(strings.contact_info_title, style: textStyle.headlineSmall),
        SizedBox(
            width: itemWidth < 300 ? screenWidth : itemWidth,
            child: CuBasicLeading(
                title: strings.contact_info_email,
                label: strings.email,
                iconData: Icons.email_outlined)),
        SizedBox(
            width: itemWidth < 300 ? screenWidth : itemWidth,
            child: CuBasicLeading(
                title: strings.contact_info_location,
                label: strings.location,
                iconData: Icons.location_on_outlined)),
      ],
    );
  }
}
