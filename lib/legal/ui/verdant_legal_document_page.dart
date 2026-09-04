import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/utils/url_luncher_module.dart';
import 'package:sergio_web/common/widgets/cu_text_link.dart';
import 'package:sergio_web/l10n/app_localizations.dart';
import 'package:sergio_web/legal/model/legal_document.dart';

/// Standalone, directly-linkable page for a real (non-template) legal
/// document — the store listings and the app's own About screen link
/// straight to these URLs, so the doc has to render as its own route.
///
/// The markdown source is the exact text supplied for the document; it is
/// never rewritten or summarized here, only rendered.
class VerdantLegalDocumentPage extends StatelessWidget {
  const VerdantLegalDocumentPage({super.key, required this.document});

  final LegalDocument document;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Title(
      title: '${document.title} — Verdant',
      color: colors.primary,
      child: Scaffold(
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
                    FutureBuilder<String>(
                      future: rootBundle.loadString(document.assetPath),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox.shrink();
                        }
                        return MarkdownBody(
                          data: snapshot.data!,
                          selectable: true,
                          onTapLink: (text, href, title) {
                            if (href == null) return;
                            UrlLauncherModule.launchSimpleUrl(href);
                          },
                          styleSheet: _verdantStyleSheet(theme),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  MarkdownStyleSheet _verdantStyleSheet(ThemeData theme) {
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    return MarkdownStyleSheet(
      p: textTheme.bodyLarge,
      h1: textTheme.headlineMedium,
      h2: textTheme.titleLarge,
      h3: textTheme.titleMedium,
      strong: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
      em: textTheme.bodyLarge?.copyWith(fontStyle: FontStyle.italic),
      listBullet: textTheme.bodyLarge,
      a: textTheme.bodyLarge?.copyWith(
        color: colors.primary,
        decoration: TextDecoration.underline,
      ),
      horizontalRuleDecoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.outline)),
      ),
      tableHead: textTheme.titleSmall,
      tableBody: textTheme.bodyMedium,
      tableBorder: TableBorder.all(color: colors.outline),
      tableCellsPadding: const EdgeInsets.all(CUSpacing.s12),
      blockSpacing: CUSpacing.s16,
      h1Padding: const EdgeInsets.only(bottom: CUSpacing.s12),
      h2Padding: const EdgeInsets.only(
        top: CUSpacing.s24,
        bottom: CUSpacing.s8,
      ),
      h3Padding: const EdgeInsets.only(
        top: CUSpacing.s16,
        bottom: CUSpacing.s8,
      ),
    );
  }
}
