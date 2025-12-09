import 'dart:ui';
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
    this.overlayColor = const Color.fromRGBO(255, 255, 255, 0.2), // Ligeramente más opaco
  });

  @override
  Widget build(BuildContext context) {
    // Si necesitas BoxShadow, la colocamos aquí.
    const double shadowBlurRadius = 15.0;

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
                color: Colors.black.withOpacity(0.1),
                blurRadius: shadowBlurRadius,
                offset: const Offset(0, 5),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.15),
                blurRadius: 5.0,
                spreadRadius: -2.0,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}