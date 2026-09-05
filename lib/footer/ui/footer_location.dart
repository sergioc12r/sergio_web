import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/l10n/app_localizations.dart';

/// Location line of the footer. The pin icon is gone — "Bogotá, Colombia"
/// does not need an icon to be recognised as a place.
class FooterLocation extends StatelessWidget {
  const FooterLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final strings = AppLocalizations.of(context)!;

    return Text(
      strings.footer_location.toUpperCase(),
      style: CUTextStyles.monoMeta.copyWith(color: colors.onSurfaceVariant),
    );
  }
}
