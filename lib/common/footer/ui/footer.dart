import 'package:flutter/material.dart';
import 'package:sergio_web/common/footer/ui/footer_location.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('Desarrollador Flutter'),
              const SizedBox(height: 20),
              FooterContactUs(),
              const SizedBox(height: 20),
              FlutterSocialMedia(),
              const SizedBox(height: 20),
              FooterLocation(),
              const SizedBox(height: 20),
              const Divider(),
              Text('© 2025 By Sergio Caro, Hecho con 💗 y Flutter'),
              const SizedBox(height: 30),
            ],
          ),
        ),
      );
    });
  }
}
