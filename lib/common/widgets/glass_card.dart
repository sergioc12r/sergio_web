import 'dart:ui'; // Necesario para el BackdropFilter
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double blurAmount;
  final double elevation;
  final Color overlayColor;

  const GlassCard({
    super.key,
    required this.child,
    this.blurAmount = 20.0,
    this.elevation = 4.0,
    this.overlayColor = const Color.fromRGBO(255, 255, 255, 0.2),
  });

  @override
  Widget build(BuildContext context) {
    final double shadowBlurRadius = elevation * 1.5;
    final Offset shadowOffset = Offset(0, elevation * 0.8);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurAmount,
          sigmaY: blurAmount,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: overlayColor,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
              width: 1.0,
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1 + (elevation / 100)),
                blurRadius: shadowBlurRadius,
                offset: shadowOffset,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
