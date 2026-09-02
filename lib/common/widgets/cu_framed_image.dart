import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/widgets/cu_striped_placeholder.dart';

/// A remote image inside a hairline frame — square corners, no shadow.
///
/// Both photographs on the site are loaded over the network, so all three
/// states are handled here rather than left to whoever calls it: while it
/// loads and if it fails, the frame is filled with [CUStripedPlaceholder] so
/// the layout never jumps and a broken URL never shows as an empty hole.
class CUFramedImage extends StatelessWidget {
  const CUFramedImage({
    super.key,
    required this.url,
    required this.placeholderLabel,
    required this.aspectRatio,
  });

  final String url;

  /// Shown inside the stripes. Say what the image *is*.
  final String placeholderLabel;

  final double aspectRatio;

  static const Duration _fadeIn = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final Widget placeholder = CUStripedPlaceholder(label: placeholderLabel);

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: CUSpacing.hairline,
            color: colors.outline,
          ),
        ),
        child: url.isEmpty
            ? placeholder
            : Image.network(
                url,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => placeholder,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return AnimatedSwitcher(
                    duration: _fadeIn,
                    switchInCurve: Curves.easeOutCubic,
                    child: frame == null ? placeholder : child,
                  );
                },
              ),
      ),
    );
  }
}
