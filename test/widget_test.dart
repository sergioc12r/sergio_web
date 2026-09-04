import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sergio_web/legal/ui/project_privacy_policy_page.dart';
import 'package:sergio_web/about_me/ui/about_me_form_view_model.dart';
import 'package:sergio_web/education/view_model/education_form_view_model.dart';
import 'package:sergio_web/experience/ui/experience_form_view_model.dart';
import 'package:sergio_web/projects/model/project_model.dart';
import 'package:sergio_web/projects/ui/projects_form.dart';
import 'package:sergio_web/projects/ui/projects_form_view_model.dart';
import 'package:sergio_web/tech_stack/ui/tech_stack_form_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sergio_web/about_me/model/about_me_model.dart';
import 'package:sergio_web/app_bar/cu_app_bar.dart';
import 'package:sergio_web/app_bar/cu_drawer_menu.dart';
import 'package:sergio_web/app_bar/model/app_bar_action_model.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/widgets/cu_text_link.dart';
import 'package:sergio_web/about_me/ui/about_me_form.dart';
import 'package:sergio_web/common/styles/cu_theme.dart';
import 'package:sergio_web/common/widgets/cu_section_header.dart';
import 'package:sergio_web/common/widgets/cu_striped_placeholder.dart';
import 'package:sergio_web/common/widgets/cu_timeline_row.dart';
import 'package:sergio_web/contact/ui/contact_me_form.dart';
import 'package:sergio_web/education/models/education.dart';
import 'package:sergio_web/education/ui/education_form.dart';
import 'package:sergio_web/experience/model/experience_model.dart';
import 'package:sergio_web/experience/ui/experience_form.dart';
import 'package:sergio_web/footer/ui/footer.dart';
import 'package:sergio_web/l10n/app_localizations.dart';
import 'package:sergio_web/profile/ui/profile_form.dart';
import 'package:sergio_web/providers/providers.dart';
import 'package:sergio_web/tech_stack/model/tech_stack_model.dart';
import 'package:sergio_web/tech_stack/ui/tech_stack_form.dart';

/// The three widths every section has to survive: small phone, tablet,
/// desktop. Overflows throw in tests, so simply pumping at each width is the
/// layout check — no golden files needed.
const List<({String name, Size size})> _viewports =
    <({String name, Size size})>[
      (name: '375dp phone', size: Size(375, 900)),
      (name: '768dp tablet', size: Size(768, 1200)),
      (name: '1440dp desktop', size: Size(1440, 1200)),
    ];

final AboutMeModel _aboutMe = AboutMeModel(
  title: 'Sobre Mí',
  subTitle: 'Creo apps que son parte de tu día a día',
  description:
      'Ingeniero mecatrónico y desarrollador de software.\n\n'
      'Más de 7 años en el sector, 6 de ellos en desarrollo móvil.',
  imageUrl: '',
  techItems: const <String>['Flutter', 'Dart', 'Firebase', 'Bloc'],
  relevantItems: const <RelevantItemModel>[
    RelevantItemModel(title: '+7', subTitle: 'Años', iconUrl: ''),
    RelevantItemModel(title: '+20', subTitle: 'Proyectos', iconUrl: ''),
    RelevantItemModel(title: '+6', subTitle: 'Años Flutter', iconUrl: ''),
    RelevantItemModel(title: '4', subTitle: 'Industrias', iconUrl: ''),
  ],
);

final List<TechStackModel> _stack = <TechStackModel>[
  const TechStackModel(name: 'Dart', iconUrl: '', category: 'lenguajes'),
  const TechStackModel(name: 'Kotlin', iconUrl: '', category: 'lenguajes'),
  const TechStackModel(name: 'Flutter', iconUrl: '', category: 'mobile'),
  const TechStackModel(name: 'Firebase', iconUrl: '', category: 'backend'),
  const TechStackModel(name: 'Git', iconUrl: '', category: 'herramientas'),

  /// Unclassified on purpose: it must fall back, not crash.
  const TechStackModel(name: 'Figma', iconUrl: ''),
];

final List<ExperienceModel> _experience = <ExperienceModel>[
  ExperienceModel(
    title: 'Senior Flutter Developer',
    company: 'Globant',
    description: 'Desarrollo de aplicaciones móviles multiplataforma.',
    isCurrent: true,
    initDate: DateTime(2023, 4),
    endDate: DateTime(2025, 9),
    skills: <ExperienceSkillModel>[
      ExperienceSkillModel(title: 'Flutter'),
      ExperienceSkillModel(title: 'Clean Architecture'),
    ],
    activities: <ExperienceActivitiesModel>[
      ExperienceActivitiesModel(body: 'Liderar el equipo móvil.'),
      ExperienceActivitiesModel(body: 'Definir la arquitectura del proyecto.'),
    ],
  ),
  ExperienceModel(
    title: 'Mobile Developer',
    company: 'Softtek',
    description: 'Mantenimiento y evolución de apps bancarias.',
    isCurrent: false,
    initDate: DateTime(2020, 1),
    endDate: DateTime(2023, 3),
    skills: <ExperienceSkillModel>[ExperienceSkillModel(title: 'Dart')],
    activities: <ExperienceActivitiesModel>[
      ExperienceActivitiesModel(body: 'Integración de APIs REST.'),
    ],
  ),
];

final List<ProjectModel> _projects = <ProjectModel>[
  const ProjectModel(
    title: 'SITP Smart',
    slug: 'sitp-smart',
    description:
        'Aplicación para visualizar los datos del sistema de transporte de Transmilenio.',
    tags: <String>['Flutter', 'Dart', 'Riverpod', 'Transporte público'],
  ),
  const ProjectModel(
    title: 'Fogon App',
    slug: 'fogon-app',
    description: 'Aplicación para crear, ver y guardar recetas.',
    tags: <String>['Flutter', 'Dart', 'Riverpod', 'Recetas'],
  ),
  const ProjectModel(
    title: 'Verdant',
    slug: 'verdant',
    description:
        'Aplicación para llevar el control del cuidado de las plantas.',
    tags: <String>[
      'Flutter',
      'Dart',
      'Riverpod',
      'Tablet',
      'Cuidado de plantas',
    ],
  ),
];

final List<Education> _education = <Education>[
  Education(
    title: 'Ingeniería Mecatrónica',
    place: 'Universidad Militar Nueva Granada',
    description: 'Pregrado.',
    educationType: EducationType.degree,
    finishDate: DateTime(2018, 12),
  ),
  Education(
    title: 'Flutter Avanzado',
    place: 'Udemy',
    description: '',
    educationType: EducationType.shortCourse,
    finishDate: DateTime(2021, 6),
  ),
];

/// Mounts one section with the real theme, the real localizations and
/// pre-seeded providers, at a given width.
Future<void> _pumpSection(
  WidgetTester tester, {
  required Widget child,
  required Size size,
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        aboutMeProvider.overrideWith((ref) => _StubAboutMe()),
        techStackProvider.overrideWith((ref) => _StubTechStack()),
        experienceProvider.overrideWith((ref) => _StubExperience()),
        educationProvider.overrideWith((ref) => _StubEducation()),
        projectsProvider.overrideWith((ref) => _StubProjects()),
      ],
      child: MaterialApp(
        theme: CUThemeData.lightTheme,
        locale: const Locale('es'),
        localizationsDelegates: const <LocalizationsDelegate<Object>>[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.all(20), child: child),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// The real view models with their state pinned, so the sections under test
/// see exactly the fixtures above instead of reading the bundled JSON.
class _StubAboutMe extends AboutMeFormViewModel {
  _StubAboutMe() {
    state = _aboutMe;
  }
}

class _StubTechStack extends TechStackFormViewModel {
  _StubTechStack() {
    state = _stack;
  }
}

class _StubExperience extends ExperienceFormViewModel {
  _StubExperience() {
    state = _experience;
  }
}

class _StubEducation extends EducationFormViewModel {
  _StubEducation() {
    state = _education;
  }
}

class _StubProjects extends ProjectsFormViewModel {
  _StubProjects() {
    state = _projects;
  }
}

/// Nav labels, in the order [CUAppBar] receives them.
const List<String> _navLabels = <String>[
  'Inicio',
  'Sobre Mi',
  'Stack Tecnológico',
  'Proyectos',
  'Experiencia',
  'Educación',
  'Contacto',
];

/// Mounts the real nav inside a [CustomScrollView], the way `HomeScreen`
/// does. `HomeScreen` itself cannot be pumped here: it logs to Firebase
/// Analytics in `initState`.
Future<void> _pumpNav(
  WidgetTester tester, {
  required Size size,
  required bool largeScreen,
  required void Function(String) onTap,
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  final List<AppBarActionModel> items = <AppBarActionModel>[
    for (final String label in _navLabels)
      AppBarActionModel(
        title: label,
        child: CUTextLink(
          label: label,
          style: CUTextStyles.monoLabel,
          onTap: () => onTap(label),
        ),
      ),
  ];

  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        theme: CUThemeData.lightTheme,
        locale: const Locale('es'),
        localizationsDelegates: const <LocalizationsDelegate<Object>>[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          endDrawer: largeScreen ? null : CUDrawerMenu(actions: items),
          body: CustomScrollView(
            slivers: <Widget>[
              CUAppBar(largeScreen: largeScreen, actionItems: items),
              const SliverToBoxAdapter(child: SizedBox(height: 2000)),
            ],
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// Mounts [ProjectPrivacyPolicyPage] for [slug] behind a real `GoRouter`,
/// the way it is actually reached in the app (a direct URL, not an in-app
/// push), with [projectsProvider] pinned to the fixture data.
Future<void> _pumpPrivacyPolicy(
  WidgetTester tester, {
  required String slug,
}) async {
  tester.view.physicalSize = const Size(1024, 900);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  final GoRouter router = GoRouter(
    initialLocation: '/projects/$slug/privacy-policy',
    routes: <RouteBase>[
      GoRoute(
        path: '/projects/:slug/privacy-policy',
        builder: (context, state) =>
            ProjectPrivacyPolicyPage(slug: state.pathParameters['slug']!),
      ),
    ],
  );

  await tester.pumpWidget(
    ProviderScope(
      overrides: [projectsProvider.overrideWith((ref) => _StubProjects())],
      child: MaterialApp.router(
        theme: CUThemeData.lightTheme,
        locale: const Locale('es'),
        localizationsDelegates: const <LocalizationsDelegate<Object>>[
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
  await tester.pumpAndSettle();
}

void main() {
  final Map<String, Widget> sections = <String, Widget>{
    'hero': ProfileForm(scrollToContact: () {}),
    'about me': const AboutMeForm(index: '01'),
    'tech stack': const TextStackForm(index: '02'),
    'projects': const ProjectsForm(index: '03'),
    'experience': const ExperienceForm(index: '04'),
    'education': const EducationForm(index: '05'),
    'contact': const ContactMeForm(index: '06'),
    'footer': const Footer(),
  };

  for (final MapEntry<String, Widget> section in sections.entries) {
    for (final ({String name, Size size}) viewport in _viewports) {
      testWidgets('${section.key} lays out at ${viewport.name}', (
        WidgetTester tester,
      ) async {
        await _pumpSection(tester, child: section.value, size: viewport.size);

        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets('section header shows its index and title', (tester) async {
    await _pumpSection(
      tester,
      child: const CUSectionHeader(index: '01', title: 'Sobre Mí'),
      size: const Size(1440, 800),
    );

    expect(find.text('01'), findsOneWidget);
    expect(find.text('Sobre Mí'), findsOneWidget);
  });

  testWidgets('striped placeholder labels what is missing', (tester) async {
    await _pumpSection(
      tester,
      child: const SizedBox(
        width: 280,
        height: 200,
        child: CUStripedPlaceholder(label: 'Retrato'),
      ),
      size: const Size(375, 800),
    );

    expect(find.text('Retrato'), findsOneWidget);
  });

  testWidgets('timeline row stacks its date on compact widths', (tester) async {
    await _pumpSection(
      tester,
      child: const CUTimelineRow(
        date: '2020 — 2023',
        badge: 'Actual',
        child: Text('Mobile Developer'),
      ),
      size: const Size(375, 800),
    );

    expect(find.text('2020 — 2023'), findsOneWidget);
    expect(find.text('ACTUAL'), findsOneWidget);
  });

  /// The nav is the one layout that has to fit seven Spanish section names
  /// and the wordmark on a single line. If it ever stops fitting, this
  /// overflows and fails rather than silently clipping.
  testWidgets('nav fits all seven links at 1024dp', (tester) async {
    final List<String> tapped = <String>[];

    await _pumpNav(
      tester,
      size: const Size(1024, 800),
      largeScreen: true,
      onTap: tapped.add,
    );

    expect(tester.takeException(), isNull);
    expect(find.byType(CUTextLink), findsNWidgets(_navLabels.length));

    await tester.tap(find.text(_navLabels.last));
    await tester.pump();
    expect(tapped, <String>[_navLabels.last]);
  });

  testWidgets('compact nav collapses to a drawer with all the links', (
    tester,
  ) async {
    await _pumpNav(
      tester,
      size: const Size(375, 800),
      largeScreen: false,
      onTap: (_) {},
    );

    expect(tester.takeException(), isNull);
    expect(find.byType(DrawerButton), findsOneWidget);

    await tester.tap(find.byType(DrawerButton));
    await tester.pumpAndSettle();

    for (final String label in _navLabels) {
      expect(find.text(label), findsOneWidget);
    }
  });

  testWidgets('privacy policy page renders the matched project', (
    tester,
  ) async {
    await _pumpPrivacyPolicy(tester, slug: 'verdant');

    expect(tester.takeException(), isNull);
    expect(find.textContaining('Verdant'), findsWidgets);
  });

  testWidgets('privacy policy page shows not-found for an unknown slug', (
    tester,
  ) async {
    await _pumpPrivacyPolicy(tester, slug: 'does-not-exist');

    expect(tester.takeException(), isNull);
    expect(find.text('No se encontró el proyecto solicitado.'), findsOneWidget);
  });

  test('uncategorised stack entries fall back instead of disappearing', () {
    const TechStackModel orphan = TechStackModel(name: 'Figma', iconUrl: '');

    expect(orphan.resolvedCategory, TechStackModel.fallbackCategory);
    expect(
      TechStackModel.categoryOrder,
      contains(TechStackModel.fallbackCategory),
    );
  });
}
