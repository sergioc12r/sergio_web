import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FooterLocation extends StatelessWidget {
  const FooterLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final style = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Icon(Icons.location_on_outlined),
        Text(strings.footer_location, style: style.bodyMedium)
      ],
    );
  }
}
