import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sergio_web/common/utils/copy_clipboard_module.dart';
import 'package:sergio_web/common/widgets/cu_transparent_button.dart';

class FooterContactUs extends StatelessWidget {
  const FooterContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final styles = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3,
      children: [
        Text(strings.footer_contact_label, style: styles.bodySmall),
        CUTransparentButton(
            onTap: () {
              CopyClipboardModule.copyToClipboard(strings.email, context);
            },
            child: Text(strings.email, style: styles.bodyMedium))
      ],
    );
  }
}
