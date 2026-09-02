import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';

/// The Flutter equivalent of the design system's
/// `repeating-linear-gradient(135deg, bgAlt 0 10px, bg 10px 20px)`.
///
/// This is deliberately a [CustomPainter] and not a [LinearGradient]:
/// `begin`/`end` on a gradient are fractional [Alignment]s, so the bands would
/// scale with the widget instead of staying a fixed 10px, and `TileMode`
/// cannot pin the step either. Painting the diagonals by hand is the only way
/// to get a constant pitch in logical pixels at any size.
///
/// Used where an image is expected but unavailable — never as filler for
/// content that does not exist.
class CUStripedPlaceholder extends StatelessWidget {
  const CUStripedPlaceholder({
    super.key,
    required this.label,
    this.width,
    this.height,
  });

  final String label;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return RepaintBoundary(
      child: CustomPaint(
        painter: _StripePainter(
          stripe: colors.surfaceContainerHighest,
          ground: colors.surface,
          border: colors.outline,
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(CUSpacing.s16),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: CUTextStyles.monoLabel.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StripePainter extends CustomPainter {
  const _StripePainter({
    required this.stripe,
    required this.ground,
    required this.border,
  });

  final Color stripe;
  final Color ground;
  final Color border;

  /// One light band plus one dark band. The stroke is drawn at half the pitch
  /// so the two read as equal widths.
  static const double _pitch = CUSizing.stripeStep * 2;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    canvas.drawRect(rect, Paint()..color = ground);

    canvas.save();
    canvas.clipRect(rect);

    /// 135°: the line advances along x by the same amount it advances along y,
    /// so sweeping the origin across `width + height` covers the whole box.
    final Paint bands = Paint()
      ..color = stripe
      ..strokeWidth = CUSizing.stripeStep
      ..strokeCap = StrokeCap.butt;

    final double span = size.width + size.height;
    for (double offset = -size.height; offset < span; offset += _pitch) {
      canvas.drawLine(
        Offset(offset, 0),
        Offset(offset + size.height, size.height),
        bands,
      );
    }
    canvas.restore();

    canvas.drawRect(
      rect.deflate(CUSpacing.hairline / 2),
      Paint()
        ..color = border
        ..style = PaintingStyle.stroke
        ..strokeWidth = CUSpacing.hairline,
    );
  }

  @override
  bool shouldRepaint(_StripePainter oldDelegate) {
    return oldDelegate.stripe != stripe ||
        oldDelegate.ground != ground ||
        oldDelegate.border != border;
  }
}
