import 'package:flutter/material.dart';

class FooterLocation extends StatelessWidget {
  const FooterLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.location_on_outlined),
        const SizedBox(width: 15),
        Text('Bogota, Colombia')
      ],
    );
  }
}
