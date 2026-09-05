import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/utils/copy_clipboard_module.dart';
import 'package:sergio_web/common/widgets/cu_basic_leading.dart';
import 'package:sergio_web/l10n/app_localizations.dart';

/// Email and location as a two-row ruled table.
///
/// The two fixed widths derived from `MediaQuery` are gone — the rows now
/// take whatever column the section gives them, which is what makes the
/// contact block work at every width without a breakpoint of its own.
class ContactMeInfo extends StatelessWidget {
  const ContactMeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final strings = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          strings.contact_info_title.toUpperCase(),
          style: CUTextStyles.monoLabel.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: CUSpacing.s8),
        CuBasicLeading(
          title: strings.contact_info_email,
          label: strings.email,
          onTap: () {
            CopyClipboardModule.copyToClipboard(strings.email, context);
          },
        ),
        CuBasicLeading(
          title: strings.contact_info_location,
          label: strings.location,
        ),
      ],
    );
  }
}
