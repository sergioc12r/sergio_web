import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyClipboardModule {
  /// Copy text into clipboard
  static Future<void> copyToClipboard(
      String textToCopy, BuildContext context) async {
    try {
      await Clipboard.setData(ClipboardData(text: textToCopy));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Copiado al portapapeles')),
      );
    } catch (e) {
      debugPrint('Error al copiar al portapapeles: $e');
      throw Exception('Failed to copy to clipboard: $e');
    }
  }
}
