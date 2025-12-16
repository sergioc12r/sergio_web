import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatefulWidget {
  final Widget child;
  final double blurAmount;

  /// Animation properties
  final double defaultScale;
  final double hoverScale;
  final Duration animationDuration;

  const GlassCard({
    super.key,
    required this.child,
    this.blurAmount = 0.3,
    this.defaultScale = 1.0,
    this.hoverScale = 1.005,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isHovering = false;
  static const double _radius = 25.0;

  void _onHover(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).cardTheme;

    /// Calculate current scale
    final double scale = _isHovering ? widget.hoverScale : widget.defaultScale;

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: widget.animationDuration,
        curve: Curves.easeInOut,
        transformAlignment: Alignment.center,
        transform: Matrix4.identity()..scale(scale, scale),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_radius),
          boxShadow: [
            BoxShadow(
              color: styles.shadowColor!.withOpacity(_isHovering ? 0.4 : 0.2),
              spreadRadius: 0.5,
              blurRadius: _isHovering ? 15 : 10,
              offset: Offset(0, _isHovering ? 6 : 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_radius),
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: widget.blurAmount, sigmaY: widget.blurAmount),
            child: Container(
              decoration: BoxDecoration(
                color: styles.color!.withOpacity(0.5),
                borderRadius: BorderRadius.circular(_radius),
                border: Border.all(
                  color: styles.shadowColor!.withOpacity(0.9),
                  width: 1.2,
                ),
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
