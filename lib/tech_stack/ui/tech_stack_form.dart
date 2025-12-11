import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/common/widgets/cu_chip.dart';
import 'package:sergio_web/common/widgets/glass_card.dart';
import 'package:sergio_web/providers/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextStackForm extends ConsumerWidget {
  const TextStackForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stack = ref.watch(techStackProvider);
    final textStyle = Theme.of(context).textTheme;
    final strings = AppLocalizations.of(context)!;

    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.07),
        child: GlassCard(
            child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 10),
            Text(strings.tech_stack_title, style: textStyle.headlineMedium),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.03),
              child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  direction: Axis.horizontal,
                  children: List.generate(stack.length, (index) {
                    var item = stack.elementAt(index);
                    return CUChip(
                      text: item.name,
                      svgUrl: item.iconUrl,
                    );
                  })),
            ),
            const SizedBox(height: 10),
          ],
        )),
      );
    });
  }
}
