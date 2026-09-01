import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sergio_web/common/icons/cu_loading.dart';
import 'package:sergio_web/common/styles/cu_theme.dart';
import 'package:sergio_web/home/ui/screen/home_screen.dart';
import 'package:sergio_web/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/providers/providers.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final currentLocale = WidgetsBinding.instance.platformDispatcher.locale;
  /// Init RiverPod container
  final container = ProviderContainer();
  /// Launch initialize notifier
  container.read(appConfigProvider.notifier).initializeData(currentLocale);
  /// Run app
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInitialized = ref.watch(appConfigProvider);

    /// Firebase isn't initialized until [appConfigProvider] finishes, so
    /// only touch FirebaseAnalytics once that's true — otherwise the first
    /// build (which runs before `Firebase.initializeApp` resolves) throws.
    final List<NavigatorObserver> navigatorObservers = isInitialized
        ? [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)]
        : const <NavigatorObserver>[];

    return MaterialApp(
      title: 'sergiocarodev.com',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      ///TODO manage theme later
      themeMode: ThemeMode.system,
      theme: CUThemeData.lightTheme,
      darkTheme: CUThemeData.darkTheme,
      navigatorObservers: navigatorObservers,
      home: isInitialized ? const HomeScreen() : const CULoading(),
    );
  }
}
