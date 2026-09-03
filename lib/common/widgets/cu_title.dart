import 'package:flutter/material.dart';

/// A section H2.
///
/// The previous version painted the last word of the title in the primary
/// color. That is gone on purpose: in this system hierarchy comes from size,
/// weight and position, and coloring a single word inside a phrase is exactly
/// the tic the redesign is meant to remove. Left-aligned, because the whole
/// page reads as a document column.
class CUTitle extends StatelessWidget {
  const CUTitle({super.key, required this.title, this.textAlign});

  final String title;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
