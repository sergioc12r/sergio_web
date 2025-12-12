import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sergio_web/common/utils/url_luncher_module.dart';
import 'package:sergio_web/common/widgets/cu_transparent_button.dart';

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem(
      {super.key,
      this.url,
      this.name,
      required this.path,
      this.color,
      this.size});

  final String? name;
  final String path;
  final double? size;
  final String? url;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).iconTheme;

    return CUTransparentButton(
        onTap: () {
          if (url == null) return;
          UrlLauncherModule.launchSimpleUrl(url!);
        },
        child: SvgPicture.asset(
          path,
          colorFilter: ColorFilter.mode(color ?? style.color!, BlendMode.srcIn),
          height: size ?? 30,
          width: size ?? 30,
        ));
  }
}
