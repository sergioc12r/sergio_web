import 'package:flutter/material.dart';
import 'package:sergio_web/app_bar/model/app_bar_action_model.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';

/// Compact-width nav.
///
/// A stacked, hairline-separated list — the same rule that separates rows
/// everywhere else on the page, so the drawer reads as part of the document
/// rather than as a floating panel.
class CUDrawerMenu extends StatelessWidget {
  const CUDrawerMenu({super.key, required this.actions});

  final List<AppBarActionModel> actions;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: CUSpacing.sectionHorizontalMobile,
          ),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: CUSpacing.s24),
            itemCount: actions.length,
            separatorBuilder: (_, _) => Divider(color: colors.outline),
            itemBuilder: (context, index) {
              return Align(
                alignment: AlignmentDirectional.centerStart,
                child: actions.elementAt(index).child,
              );
            },
          ),
        ),
      ),
    );
  }
}
