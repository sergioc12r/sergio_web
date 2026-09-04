import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:sergio_web/common/navigation/app_router.dart';
import 'package:sergio_web/common/styles/cu_theme.dart';
import 'package:sergio_web/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Real paths (`/projects/verdant/privacy-policy`) instead of the default
  /// `/#/projects/...` hash — required for the privacy policy links to look
  /// like normal URLs on store listings. The web host has to fall back to
  /// `index.html` for any path, or a direct hit / refresh 404s: see
  /// `vercel.json` at the repo root.
  usePathUrlStrategy();

  /// Without this, `context.push` (used by every legal-document link) moves
  /// the in-app Navigator stack but never reports the new location to the
  /// browser — the address bar stays put while the page underneath it
  /// changes. `go()` doesn't need this; only the imperative push/pop family
  /// does.
  GoRouter.optionURLReflectsImperativeAPIs = true;

  final currentLocale = WidgetsBinding.instance.platformDispatcher.locale;

  /// Init RiverPod container
  final container = ProviderContainer();

  /// Launch initialize notifier
  container.read(appConfigProvider.notifier).initializeData(currentLocale);

  /// Run app
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  /// Built once and unconditionally — a deep link straight into a legal
  /// page has to resolve on the very first frame, before
  /// [appConfigProvider] is ready, or the browser's initial route gets
  /// dropped. The analytics observer is wrapped in [_LazyFirebaseObserver]
  /// rather than constructed directly here: `FirebaseAnalyticsObserver(...)`
  /// touches `FirebaseAnalytics.instance` at construction time, which throws
  /// if `Firebase.initializeApp` (kicked off in `main()`) hasn't resolved
  /// yet — and on this first frame it hasn't.
  late final GoRouter _router = GoRouter(
    routes: appRoutes,
    observers: <NavigatorObserver>[_LazyFirebaseObserver()],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'sergiocarodev.com',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: CUThemeData.lightTheme,
      routerConfig: _router,
    );
  }
}

/// Forwards to a real [FirebaseAnalyticsObserver], but only once
/// `Firebase.initializeApp` has actually resolved. Route changes that
/// happen before that (the deep-link case) simply go unlogged instead of
/// crashing the app.
class _LazyFirebaseObserver extends NavigatorObserver {
  FirebaseAnalyticsObserver? _delegate;

  FirebaseAnalyticsObserver? get _observer {
    if (_delegate != null) return _delegate;
    if (Firebase.apps.isEmpty) return null;
    return _delegate = FirebaseAnalyticsObserver(
      analytics: FirebaseAnalytics.instance,
    );
  }

  @override
  void didPush(Route route, Route? previousRoute) =>
      _observer?.didPush(route, previousRoute);

  @override
  void didPop(Route route, Route? previousRoute) =>
      _observer?.didPop(route, previousRoute);

  @override
  void didRemove(Route route, Route? previousRoute) =>
      _observer?.didRemove(route, previousRoute);

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) =>
      _observer?.didReplace(newRoute: newRoute, oldRoute: oldRoute);
}
