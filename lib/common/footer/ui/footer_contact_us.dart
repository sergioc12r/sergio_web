import 'package:flutter/material.dart';

class FooterContactUs extends StatelessWidget {
  const FooterContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact me:'),
        /// TODO add launch url with email curl
        Text('sergio951112@gmail.com')
      ],
    );
  }
}
