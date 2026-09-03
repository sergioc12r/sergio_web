import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/about_me/model/about_me_model.dart';
import 'package:sergio_web/about_me/ui/relevant_item_card.dart';
import 'package:sergio_web/common/styles/cu_breakpoints.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/widgets/cu_framed_image.dart';
import 'package:sergio_web/common/widgets/cu_section_header.dart';
import 'package:sergio_web/providers/providers.dart';

/// Section 01.
///
/// A 280px / 1fr split: the photograph is pinned to a narrow column and the
/// prose gets the rest. The asymmetry is the point — an even two-column split
/// would read as a marketing block, this reads as a spread.
class AboutMeForm extends ConsumerWidget {
  const AboutMeForm({super.key, required this.index});

  final String index;

  static const double _portraitRatio = 3 / 4;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AboutMeModel? data = ref.watch(aboutMeProvider);

    if (data == null) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isCompact = CUBreakpoints.isCompact(constraints.maxWidth);

        final Widget portrait = CUFramedImage(
          url: data.imageUrl,
          placeholderLabel: data.title,
          aspectRatio: _portraitRatio,
        );

        final Widget prose = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              data.subTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: CUSpacing.s20),
            Text(
              data.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: CUSpacing.s24),
            _TechList(items: data.techItems),
          ],
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CUSectionHeader(index: index, title: data.title),
            const SizedBox(height: CUSpacing.s40),
            if (isCompact)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  portrait,
                  const SizedBox(height: CUSpacing.s32),
                  prose,
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: CUSizing.narrowColumn, child: portrait),
                  const SizedBox(width: CUSpacing.s48),
                  Expanded(child: prose),
                ],
              ),
            const SizedBox(height: CUSpacing.s48),
            _StatsRow(items: data.relevantItems, isCompact: isCompact),
          ],
        );
      },
    );
  }
}

/// Tech list as running mono text separated by middots.
///
/// These were colored chips. As a single line they stop competing with the
/// prose above them and read as what they are — a list of names.
class _TechList extends StatelessWidget {
  const _TechList({required this.items});

  final List<String> items;

  static const String _separator = '  ·  ';

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    final colors = Theme.of(context).colorScheme;

    return Text(
      items.join(_separator),
      style: CUTextStyles.monoTag.copyWith(color: colors.onSurfaceVariant),
    );
  }
}

/// The statistics, as a single ruled row.
///
/// On compact widths it folds to two columns rather than shrinking the
/// figures, because a 32px mono numeral is the whole point of the row.
class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.items, required this.isCompact});

  final List<RelevantItemModel> items;
  final bool isCompact;

  static const int _compactColumns = 2;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    final colors = Theme.of(context).colorScheme;
    final int columns = isCompact ? _compactColumns : items.length;

    final List<List<RelevantItemModel>> rows = <List<RelevantItemModel>>[];
    for (int i = 0; i < items.length; i += columns) {
      rows.add(
        items.sublist(i, i + columns > items.length ? items.length : i + columns),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(color: colors.outline),
        for (int r = 0; r < rows.length; r++) ...<Widget>[
          if (r > 0) Divider(color: colors.outline),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                for (int c = 0; c < columns; c++)
                  Expanded(
                    child: c < rows[r].length
                        ? RelevantItemCard(
                            item: rows[r][c],
                            showLeadingRule: c > 0,
                          )
                        : const SizedBox.shrink(),
                  ),
              ],
            ),
          ),
        ],
        Divider(color: colors.outline),
      ],
    );
  }
}
