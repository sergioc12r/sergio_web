import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CUChip extends StatelessWidget {
  const CUChip({super.key, required this.text, this.isSelected, this.svgUrl});

  final String text;
  final bool? isSelected;
  final String? svgUrl;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text),
      avatar: _checkAsset(svgUrl),
    );
  }

  Widget? _checkAsset(String? url){
    if(url?.isEmpty ?? true){
      return null;
    }

    if(url!.contains('http')){
      return SvgPicture.network(
        svgUrl!
      );
    }

    return SvgPicture.asset(
      svgUrl!,
      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
  }
}
