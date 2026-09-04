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

/// A standalone, directly-linkable privacy policy page for one project.
///
/// Store listings (Google Play, App Store) require a public URL for this —
/// it cannot live behind the one-page scroll, which is why the app has a
/// router at all. The body is a generic template: real per-project specifics
/// (what data is collected, third-party SDKs, etc.) are marked in accent and
/// have to be filled in by hand — never invented.
class ProjectPrivacyPolicyPage extends ConsumerWidget {
  const ProjectPrivacyPolicyPage({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ProjectModel> projects = ref.watch(projectsProvider);
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    ProjectModel? project;
    for (final ProjectModel candidate in projects) {
      if (candidate.slug == slug) {
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
                  if (project == null)
                    Text(
                      strings.legal_project_not_found,
                      style: theme.textTheme.bodyLarge,
                    )
                  else
                    _PolicyBody(project: project, strings: strings),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PolicyBody extends StatelessWidget {
  const _PolicyBody({required this.project, required this.strings});

  final ProjectModel project;
  final AppLocalizations strings;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final List<({String title, String body, String placeholder})> sections =
        <({String title, String body, String placeholder})>[
          (
            title: strings.legal_section_data_title,
            body: strings.legal_section_data_body(project.title),
            placeholder: strings.legal_section_data_placeholder(project.title),
          ),
          (
            title: strings.legal_section_use_title,
            body: strings.legal_section_use_body,
            placeholder: strings.legal_section_use_placeholder,
          ),
          (
            title: strings.legal_section_storage_title,
            body: strings.legal_section_storage_body,
            placeholder: strings.legal_section_storage_placeholder,
          ),
          (
            title: strings.legal_section_third_parties_title,
            body: strings.legal_section_third_parties_body,
            placeholder: strings.legal_section_third_parties_placeholder,
          ),
          (
            title: strings.legal_section_contact_title,
            body: strings.legal_section_contact_body,
            placeholder: strings.email,
          ),
        ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          strings.legal_privacy_policy_eyebrow.toUpperCase(),
          style: CUTextStyles.monoLabel.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: CUSpacing.s12),
        CUTitle(
          title: '${strings.legal_privacy_policy_title} — ${project.title}',
        ),
        const SizedBox(height: CUSpacing.s8),
        Text(
          strings.legal_last_updated,
          style: CUTextStyles.monoMeta.copyWith(color: colors.onSurfaceVariant),
        ),
        const SizedBox(height: CUSpacing.s24),
        Divider(color: colors.outline),
        const SizedBox(height: CUSpacing.s40),
        for (int i = 0; i < sections.length; i++) ...<Widget>[
          if (i > 0) ...<Widget>[
            const SizedBox(height: CUSpacing.s32),
            Divider(color: colors.outline),
            const SizedBox(height: CUSpacing.s32),
          ],
          Text(sections[i].title, style: theme.textTheme.titleLarge),
          const SizedBox(height: CUSpacing.s12),
          Text(sections[i].body, style: theme.textTheme.bodyLarge),
          const SizedBox(height: CUSpacing.s12),
          Text(
            sections[i].placeholder,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colors.primary,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ],
    );
  }
}
