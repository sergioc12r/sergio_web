import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double blurAmount;

  const GlassCard({
    super.key,
    required this.child,
    this.blurAmount = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).cardTheme;
    const double radius = 25.0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: styles.shadowColor!.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
          child: Container(
            decoration: BoxDecoration(
              color: styles.color!.withOpacity(0.5),
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(
                color: styles.shadowColor!.withOpacity(0.9),
                width: 1.2,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
