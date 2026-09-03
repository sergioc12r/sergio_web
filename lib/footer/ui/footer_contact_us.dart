import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/utils/copy_clipboard_module.dart';
import 'package:sergio_web/common/widgets/cu_text_link.dart';
import 'package:sergio_web/l10n/app_localizations.dart';

/// The email address in the footer. Tapping it still copies to the clipboard.
class FooterContactUs extends StatelessWidget {
  const FooterContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;

    return CUTextLink(
      label: strings.email,
      style: CUTextStyles.monoTag,
      onTap: () {
        CopyClipboardModule.copyToClipboard(strings.email, context);
      },
    );
  }
}
