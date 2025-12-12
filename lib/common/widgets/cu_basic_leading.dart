import 'package:flutter/material.dart';
import 'package:sergio_web/common/widgets/cu_transparent_button.dart';
import 'package:sergio_web/common/widgets/glass_card.dart';

class CuBasicLeading extends StatelessWidget {
  const CuBasicLeading(
      {super.key,
      required this.title,
      required this.label,
      required this.iconData,
      this.onTap});

  final String title;
  final String label;
  final IconData iconData;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final widget = GlassCard(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0x510091FF),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.transparent,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(iconData, size: 25, color: Colors.white),
            ),
          ),
          const SizedBox(width: 15),
          Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(title),
                const SizedBox(height: 5),
                Text(label),
              ]))
        ],
      ),
    ));

    if (onTap == null) {
      return widget;
    }
    return CUTransparentButton(onTap: onTap!, child: widget);
  }
}
