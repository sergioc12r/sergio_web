import 'package:flutter/material.dart';
import 'package:sergio_web/common/footer/ui/footer_%20location.dart';
import 'package:sergio_web/common/footer/ui/footer_contact_us.dart';
import 'package:sergio_web/common/footer/ui/footer_social_media.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      return Container(
        width: constraints.maxWidth,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            FooterContactUs(),
            const SizedBox(height: 20),
            FlutterSocialMedia(),
            const SizedBox(height: 20),
            FooterLocation(),
            const SizedBox(height: 20),
            const Divider(),
            Text('© 2025 By Sergio Caro'),
            const SizedBox(height: 20),
          ],
        ),
      );
    });
  }
}
