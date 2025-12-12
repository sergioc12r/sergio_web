import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherModule {

  static Future<void> launchSimpleUrl(String url) async {
    final uri = Uri.parse(url);

    /// Check if is mobile app
    if(!kIsWeb){
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
}
