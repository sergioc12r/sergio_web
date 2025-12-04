import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem(
      {super.key, this.url, this.name, required this.path, this.color, this.size});

  final String? name;
  final String path;
  final double? size;
  final String? url;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// TODO add launch URL
        //launchUrl(Uri.parse(url!));
      },
      child: SvgPicture.asset(
        path,
        colorFilter: ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),
        height: size ?? 30,
        width: size ?? 30,
      ),
    );
  }
}
