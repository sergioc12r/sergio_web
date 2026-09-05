import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/common/styles/cu_breakpoints.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/widgets/cu_section_header.dart';
import 'package:sergio_web/l10n/app_localizations.dart';
import 'package:sergio_web/providers/providers.dart';
import 'package:sergio_web/tech_stack/model/tech_stack_model.dart';

/// Section 02.
///
/// An index, not a badge wall: four categories inside one shared frame,
/// column headers in mono, entries as plain text. `icon_url` is deliberately
/// unused — nineteen brand logos is nineteen competing colors, and the names
/// carry the same information at a fraction of the noise.
class TextStackForm extends ConsumerWidget {
  const TextStackForm({super.key, required this.index});

  final String index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TechStackModel> stack = ref.watch(techStackProvider);
    final strings = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;

    final Map<String, List<TechStackModel>> grouped =
        <String, List<TechStackModel>>{};
    for (final TechStackModel item in stack) {
      grouped
          .putIfAbsent(item.resolvedCategory, () => <TechStackModel>[])
          .add(item);
    }

    final List<String> categories = TechStackModel.categoryOrder
        .where((String c) => grouped[c]?.isNotEmpty ?? false)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CUSectionHeader(index: index, title: strings.tech_stack_title),
        const SizedBox(height: CUSpacing.s40),
        if (categories.isEmpty)
          const SizedBox.shrink()
        else
          LayoutBuilder(
            builder: (context, constraints) {
              final bool isCompact = CUBreakpoints.isCompact(
                constraints.maxWidth,
              );

              return DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: CUSpacing.hairline,
                    color: colors.outline,
                  ),
                ),
                child: isCompact
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          for (
                            int i = 0;
                            i < categories.length;
                            i++
                          ) ...<Widget>[
                            if (i > 0) Divider(color: colors.outline),
                            _StackColumn(
                              category: categories[i],
                              items: grouped[categories[i]]!,
                            ),
                          ],
                        ],
                      )
                    : IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            for (int i = 0; i < categories.length; i++)
                              Expanded(
                                child: _StackColumn(
                                  category: categories[i],
                                  items: grouped[categories[i]]!,
                                  showLeadingRule: i > 0,
                                ),
                              ),
                          ],
                        ),
                      ),
              );
            },
          ),
      ],
    );
  }
}

class _StackColumn extends StatelessWidget {
  const _StackColumn({
    required this.category,
    required this.items,
    this.showLeadingRule = false,
  });

  final String category;
  final List<TechStackModel> items;
  final bool showLeadingRule;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: showLeadingRule ? CUSpacing.hairline : 0,
            color: showLeadingRule ? colors.outline : Colors.transparent,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CUSpacing.s20,
          vertical: CUSpacing.s24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              category.toUpperCase(),
              style: CUTextStyles.monoLabel.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: CUSpacing.s16),
            for (final TechStackModel item in items)
              Padding(
                padding: const EdgeInsets.only(bottom: CUSpacing.s8),
                child: Text(item.name, style: theme.textTheme.titleSmall),
              ),
          ],
        ),
      ),
    );
  }
}
