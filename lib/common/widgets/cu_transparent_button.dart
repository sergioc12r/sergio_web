import 'package:flutter/material.dart';

class CUTransparentButton extends StatelessWidget {
  const CUTransparentButton(
      {super.key, required this.child, required this.onTap});

  final Widget child;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = Theme.of(context).elevatedButtonTheme;

    return ElevatedButton(
        onPressed: onTap,
        style: buttonStyle.style!.copyWith(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          elevation: WidgetStateProperty.all(0),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
        ),
        child: child);
  }
}
