import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sergio_web/common/styles/cu_breakpoints.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/widgets/cu_section_header.dart';
import 'package:sergio_web/common/widgets/cu_striped_placeholder.dart';
import 'package:sergio_web/common/widgets/cu_text_link.dart';
import 'package:sergio_web/l10n/app_localizations.dart';
import 'package:sergio_web/projects/model/project_model.dart';
import 'package:sergio_web/providers/providers.dart';

/// Section 03.
///
/// A 3-column grid inside one shared border, the same framing device as the
/// tech stack index — cells separated by hairlines, never gaps with shadows.
/// Each cell is an image placeholder (no screenshots yet), a title, the real
/// description and its tags as plain mono text.
class ProjectsForm extends ConsumerWidget {
  const ProjectsForm({super.key, required this.index});

  final String index;

  static const int _columns = 3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ProjectModel> projects = ref.watch(projectsProvider);
    final strings = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CUSectionHeader(index: index, title: strings.projects_title),
        const SizedBox(height: CUSpacing.s40),
        if (projects.isEmpty)
          const SizedBox.shrink()
        else
          LayoutBuilder(
            builder: (context, constraints) {
              final bool isCompact = CUBreakpoints.isCompact(
                constraints.maxWidth,
              );
              final int columns = isCompact ? 1 : _columns;

              return DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: CUSpacing.hairline,
                    color: colors.outline,
                  ),
                ),
                child: _ProjectsGrid(
                  projects: projects,
                  columns: columns,
                  strings: strings,
                ),
              );
            },
          ),
      ],
    );
  }
}

/// Lays [projects] out in rows of [columns], with a hairline between every
/// cell — vertical between columns, horizontal between rows.
class _ProjectsGrid extends StatelessWidget {
  const _ProjectsGrid({
    required this.projects,
    required this.columns,
    required this.strings,
  });

  final List<ProjectModel> projects;
  final int columns;
  final AppLocalizations strings;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final int rowCount = (projects.length / columns).ceil();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (int row = 0; row < rowCount; row++) ...<Widget>[
          if (row > 0)
            Divider(height: CUSpacing.hairline, color: colors.outline),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                for (int col = 0; col < columns; col++)
                  if (row * columns + col < projects.length)
                    Expanded(
                      child: _ProjectCell(
                        project: projects[row * columns + col],
                        showLeadingRule: col > 0,
                        strings: strings,
                      ),
                    )
                  else
                    const Expanded(child: SizedBox.shrink()),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _ProjectCell extends StatelessWidget {
  const _ProjectCell({
    required this.project,
    required this.showLeadingRule,
    required this.strings,
  });

  final ProjectModel project;
  final bool showLeadingRule;
  final AppLocalizations strings;

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
        padding: const EdgeInsets.all(CUSpacing.s20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 10,
              child: project.imageAssetPath == null
                  ? CUStripedPlaceholder(label: project.title)
                  : Image.asset(project.imageAssetPath!, fit: BoxFit.cover),
            ),
            const SizedBox(height: CUSpacing.s16),
            Text(project.title, style: theme.textTheme.titleMedium),
            const SizedBox(height: CUSpacing.s8),
            Text(project.description, style: theme.textTheme.bodyMedium),
            const SizedBox(height: CUSpacing.s16),
            Text(
              project.tags.join(' · '),
              style: CUTextStyles.monoTag.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: CUSpacing.s16),
            if (project.legalLinks.isEmpty)
              CUTextLink(
                label: strings.legal_privacy_policy_link,
                style: CUTextStyles.monoLabel,
                onTap: () =>
                    context.push('/projects/${project.slug}/privacy-policy'),
              )
            else
              Wrap(
                spacing: CUSpacing.s16,
                runSpacing: CUSpacing.s8,
                children: <Widget>[
                  for (final ProjectLegalLink link in project.legalLinks)
                    CUTextLink(
                      label: link.label,
                      style: CUTextStyles.monoLabel,
                      onTap: () => context.push(link.path),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
