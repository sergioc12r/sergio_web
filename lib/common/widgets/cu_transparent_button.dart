import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';

/// A bare tappable region.
///
/// It used to be an [ElevatedButton] with its fill and shadow stripped away,
/// which meant every caller inherited button padding and a Material ink
/// splash it never wanted. It is now what its name always claimed: an
/// [InkResponse] that adds a hit target and nothing else, so the child is
/// free to be whatever the section needs.
class CUTransparentButton extends StatelessWidget {
  const CUTransparentButton({
    super.key,
    required this.child,
    required this.onTap,
    this.semanticLabel,
  });

  final Widget child;
  final VoidCallback onTap;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      child: InkResponse(
        onTap: onTap,
        radius: CUSizing.minTapTarget / 2,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: CUSizing.minTapTarget,
            minHeight: CUSizing.minTapTarget,
          ),
          child: Center(widthFactor: 1, heightFactor: 1, child: child),
        ),
      ),
    );
  }
}
