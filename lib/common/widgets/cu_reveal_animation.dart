import 'dart:async';
import 'package:flutter/material.dart';

/// Widget to manage basic animation from [CustomScrollView]
/// Using [GlobalKey] to calculate scroll
/// Receive [Stream] to manage scroll
class RevealAnimator extends StatefulWidget {
  final Widget child;
  final GlobalKey widgetKey;
  final Stream<double> scrollStream;
  final double revealOffset;

  const RevealAnimator({
    super.key,
    required this.child,
    required this.widgetKey,
    required this.scrollStream,
    this.revealOffset = 650.0,
  });

  @override
  State<RevealAnimator> createState() => _RevealAnimatorState();
}

class _RevealAnimatorState extends State<RevealAnimator> {
  double? _initialWidgetOffset;
  bool _isVisible = false;

  StreamSubscription<double>? _scrollSubscription;

  @override
  void initState() {
    super.initState();

    /// Init Listener of scroll stream
    _scrollSubscription = widget.scrollStream.listen(_checkVisibility);

    /// Calculate initial position when rendered
    /// Using the [GlobalKey]
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _initialWidgetOffset = _getWidgetOffset(widget.widgetKey);
        _checkVisibility(0.0);
      }
    });
  }

  @override
  void dispose() {
    /// Don't forget cancel the subscription to avoid memory leaks
    _scrollSubscription?.cancel();
    super.dispose();
  }

  /// Method that calculate the widget global position
  double _getWidgetOffset(GlobalKey key) {
    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return double.infinity;
    return renderBox.localToGlobal(Offset.zero).dy;
  }

  /// Method to check if the widget is visible and current position
  void _checkVisibility(double currentScrollOffset) {
    /// Check if the initial position is null or the widget is already visible
    if (_initialWidgetOffset == null || _isVisible) return;

    /// Calculate the reveal point compare with the reveal offset
    /// usually is a percentage of the screen height
    final revealPoint = _initialWidgetOffset! - widget.revealOffset;

    /// Set visibility in true and cancel the subscription to
    /// only check the visibility once
    /// avoid rebuilds
    if (currentScrollOffset > revealPoint) {
      setState(() {
        _isVisible = true;
      });
      _scrollSubscription?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 600),
      opacity: _isVisible ? 1.0 : 0.0,
      curve: Curves.easeOut,
      child: Transform.translate(
        offset: Offset(0, _isVisible ? 0 : 50),
        child: widget.child,
      ),
    );
  }
}
