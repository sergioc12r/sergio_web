import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sergio_web/l10n/app_localizations.dart';

class CopyClipboardModule {
  /// Copy text into clipboard
  /// TODO check launch email
  static Future<void> copyToClipboard(
    String textToCopy,
    BuildContext context,
  ) async {
    try {
      await Clipboard.setData(ClipboardData(text: textToCopy));
      if (!context.mounted) return;
      final strings = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(strings.copy_clipboard_message)));
    } catch (e) {
      debugPrint('Error al copiar al portapapeles: $e');
      throw Exception('Failed to copy to clipboard: $e');
    }
  }
}
