import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/theme_colors.dart';

class CUTitle extends StatelessWidget {
  const CUTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Center(
      child: buildSeparatedText(
        fullText: title,
        baseStyle: textStyle.headlineLarge!,
        lastWordStyle: textStyle.headlineLarge!.copyWith(color: CUThemeColors.primaryLight),
      ),
    );
  }

  Widget buildSeparatedText({
    required String fullText,
    required TextStyle baseStyle,
    required TextStyle lastWordStyle,
  }) {
    int lastSpaceIndex = fullText.lastIndexOf(' ');

    if (lastSpaceIndex == -1) {
      return Text(fullText, style: baseStyle);
    }

    String baseText = fullText.substring(0, lastSpaceIndex);
    String lastWord = fullText.substring(lastSpaceIndex);

    return RichText(
      text: TextSpan(
        style: baseStyle,
        children: <TextSpan>[
          TextSpan(text: baseText),
          TextSpan(
            text: lastWord,
            style: lastWordStyle,
          ),
        ],
      ),
    );
  }
}
