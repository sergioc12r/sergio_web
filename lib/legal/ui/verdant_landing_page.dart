import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/widgets/cu_text_link.dart';
import 'package:sergio_web/common/widgets/cu_title.dart';
import 'package:sergio_web/l10n/app_localizations.dart';
import 'package:sergio_web/projects/model/project_model.dart';
import 'package:sergio_web/providers/providers.dart';

/// Landing for `/verdantapp` — what a store listing, a QR code on packaging,
/// or a link in the app's own About screen sends people to. It has to
/// resolve on the very first frame (same deep-link constraint as the legal
/// pages under it) so it reads [projectsProvider] directly rather than
/// waiting on [appConfigProvider]: that provider starts empty and this
/// widget just rebuilds once `loadProjectsData` fills it in.
class VerdantLandingPage extends ConsumerWidget {
  const VerdantLandingPage({super.key});

  static const String _slug = 'verdant';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ProjectModel> projects = ref.watch(projectsProvider);
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    ProjectModel? project;
    for (final ProjectModel candidate in projects) {
      if (candidate.slug == _slug) {
        project = candidate;
        break;
      }
    }

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: CUSpacing.sectionHorizontalMobile,
            vertical: CUSpacing.s40,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: CUSizing.maxContentWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CUTextLink(
                    label: strings.legal_back_link,
                    style: CUTextStyles.monoLabel,
                    onTap: () => context.go('/'),
                  ),
                  const SizedBox(height: CUSpacing.s32),
                  if (projects.isEmpty)
                    const SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (project == null)
                    Text(
                      strings.legal_project_not_found,
                      style: theme.textTheme.bodyLarge,
                    )
                  else
                    _VerdantSummary(project: project),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VerdantSummary extends StatelessWidget {
  const _VerdantSummary({required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (project.imageAssetPath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(CUSpacing.s16),
                child: Image.asset(
                  project.imageAssetPath!,
                  width: 96,
                  height: 96,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(width: CUSpacing.s24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CUTitle(title: project.title),
                  const SizedBox(height: CUSpacing.s12),
                  Text(project.description, style: theme.textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        ),
        if (project.tags.isNotEmpty) ...<Widget>[
          const SizedBox(height: CUSpacing.s24),
          Text(
            project.tags.join(' · '),
            style: CUTextStyles.monoTag.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
        ],
        if (project.legalLinks.isNotEmpty) ...<Widget>[
          const SizedBox(height: CUSpacing.s40),
          Divider(color: colors.outline),
          const SizedBox(height: CUSpacing.s32),
          Text(
            AppLocalizations.of(
              context,
            )!.legal_privacy_policy_eyebrow.toUpperCase(),
            style: CUTextStyles.monoLabel.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: CUSpacing.s16),
          Wrap(
            spacing: CUSpacing.s24,
            runSpacing: CUSpacing.s12,
            children: <Widget>[
              for (final ProjectLegalLink link in project.legalLinks)
                CUTextLink(
                  label: link.label,
                  onTap: () => context.push(link.path),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
