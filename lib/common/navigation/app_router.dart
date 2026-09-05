import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sergio_web/common/icons/cu_loading.dart';
import 'package:sergio_web/home/ui/screen/home_screen.dart';
import 'package:sergio_web/legal/model/legal_document.dart';
import 'package:sergio_web/legal/ui/project_privacy_policy_page.dart';
import 'package:sergio_web/legal/ui/verdant_landing_page.dart';
import 'package:sergio_web/legal/ui/verdant_legal_document_page.dart';
import 'package:sergio_web/providers/providers.dart';

/// The whole site's route table.
///
/// Kept flat on purpose: this is a one-page site plus a handful of standalone
/// legal pages per project, not an app with nested navigation stacks.
final List<RouteBase> appRoutes = <RouteBase>[
  GoRoute(path: '/', builder: (context, state) => const _HomeGate()),
  GoRoute(
    path: '/projects/:slug/privacy-policy',
    builder: (context, state) =>
        ProjectPrivacyPolicyPage(slug: state.pathParameters['slug']!),
  ),

  /// Verdant ships its own real legal documents (not the generic template
  /// above) — the app's own About screen and store listings link straight
  /// to these fixed paths, so they can't move under /projects/:slug/.
  /// `/verdantapp` itself (no sub-path) is the condensed one-pager for
  /// anyone who lands on the bare URL — a QR code, a store listing, a link
  /// typed by hand — instead of a 404.
  GoRoute(
    path: '/verdantapp',
    builder: (context, state) => const VerdantLandingPage(),
  ),
  GoRoute(
    path: '/verdantapp/terms-of-service',
    builder: (context, state) => const VerdantLegalDocumentPage(
      document: LegalDocument(
        title: 'Terms of Service',
        assetPath: 'assets/legal/verdant/terms_of_service.md',
      ),
    ),
  ),
  GoRoute(
    path: '/verdantapp/privacy-policy',
    builder: (context, state) => const VerdantLegalDocumentPage(
      document: LegalDocument(
        title: 'Privacy Policy',
        assetPath: 'assets/legal/verdant/privacy_policy.md',
      ),
    ),
  ),
  GoRoute(
    path: '/verdantapp/eula',
    builder: (context, state) => const VerdantLegalDocumentPage(
      document: LegalDocument(
        title: 'End-User License Agreement',
        assetPath: 'assets/legal/verdant/eula.md',
      ),
    ),
  ),
];

/// `/` needs [appConfigProvider]'s data before [HomeScreen] can render, but
/// the router itself must exist unconditionally from the first frame — a
/// deep link straight to `/verdantapp/...` has to resolve even while that
/// data is still loading, and it can't if the app boots on a plain
/// [MaterialApp] and only swaps to [MaterialApp.router] once loading
/// finishes: the engine reports the browser's initial route to the legacy
/// [Navigator] on that first frame, finds no matching route, and discards
/// it — see the "Could not navigate to initial route" warning. Gating the
/// loading state inside this one route, instead of gating the whole router,
/// keeps every path resolvable from frame one.
class _HomeGate extends ConsumerWidget {
  const _HomeGate();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isInitialized = ref.watch(appConfigProvider);
    return isInitialized ? const HomeScreen() : const CULoading();
  }
}
