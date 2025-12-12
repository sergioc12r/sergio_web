import 'package:flutter/material.dart';

class CuIconContainer extends StatelessWidget {
  const CuIconContainer(
      {super.key,
      required this.iconData,
      this.iconColor,
      this.iconSize,
      this.gradient});

  final IconData iconData;
  final Color? iconColor;
  final double? iconSize;
  final LinearGradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: gradient ??
            const LinearGradient(
              colors: [
                Color(0xFF3B59FF),
                Color(0xFF00C6FF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
      ),

      child: Padding(
        padding: EdgeInsets.all((iconSize ?? 36) / 5),
        child: Center(
          child: Icon(
            iconData,
            size: iconSize ?? 36,
            color: iconColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
