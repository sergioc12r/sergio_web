import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherModule {
  static Future<void> launchSimpleUrl(String url) async {
    final uri = Uri.parse(url);

    /// Check if is mobile app
    if (!kIsWeb) {
      if (!await canLaunchUrl(uri)) {
        throw Exception('Could not launch $url');
      }

      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      return;
    }

    /// Launch in web

    LaunchMode launchMode;
    if (uri.scheme == 'http' || uri.scheme == 'https') {
      launchMode = LaunchMode.externalApplication;
    } else {
      launchMode = LaunchMode.platformDefault;
    }

    await launchUrl(
      uri,
      mode: launchMode,
      webOnlyWindowName: '_blank',
    );
  }

  static Future<void> launchEmail(String url) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: url,
      query: encodeQueryParameters(<String, String>{
        'subject': '',
        'body': '',
      })!,
    );

    await launchUrl(
      emailLaunchUri,
      mode: LaunchMode.externalNonBrowserApplication,
    );
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
