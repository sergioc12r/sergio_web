import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:sergio_web/common/navigation/app_router.dart';
import 'package:sergio_web/common/styles/cu_theme.dart';
import 'package:sergio_web/l10n/app_localizations.dart';
import 'package:sergio_web/legal/ui/verdant_landing_page.dart';
import 'package:sergio_web/legal/ui/verdant_legal_document_page.dart';

Future<void> _pumpDeepLink(WidgetTester tester, String initialLocation) async {
  final router = GoRouter(routes: appRoutes, initialLocation: initialLocation);

  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp.router(
        theme: CUThemeData.lightTheme,
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    ),
  );
  await tester.pump();
}

void main() {
  testWidgets(
    'a direct deep link to a legal page resolves without provider data',
    (tester) async {
      await _pumpDeepLink(tester, '/verdantapp/terms-of-service');

      expect(tester.takeException(), isNull);
      expect(find.byType(VerdantLegalDocumentPage), findsOneWidget);
    },
  );

  testWidgets(
    'a direct deep link to the bare /verdantapp URL resolves, not a 404',
    (tester) async {
      await _pumpDeepLink(tester, '/verdantapp');

      expect(tester.takeException(), isNull);
      expect(find.byType(VerdantLandingPage), findsOneWidget);
    },
  );
}
