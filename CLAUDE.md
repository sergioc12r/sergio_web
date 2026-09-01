# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Portfolio website (sergiocarodev.com) built with Flutter (mobile/web, one-page layout). Flutter SDK ^3.6.0, Flutter version 3.27.1. State management: `flutter_riverpod`. Content (education, experience, tech stack, about me) is read from locale-specific JSON assets, not hardcoded.

## Commands

```bash
# Install dependencies
flutter pub get

# Run locally in Chrome
flutter run -d chrome

# Enable web support (first-time setup only)
flutter config --enable-web

# Production web build
flutter build web --release

# Lint
flutter analyze

# Run all tests
flutter test

# Run a single test file
flutter test test/widget_test.dart
```

### Firebase setup (required before running)

`lib/firebase_options.dart` is gitignored and not present by default — the app will not build/run without it. Generate it locally:

```bash
firebase login
dart pub global activate flutterfire_cli
flutterfire configure
```

`lib/firebase_options_example.dart` shows the expected shape. Firebase is used for `cloud_firestore` (contact form submissions) and `firebase_analytics`.

## Architecture

**Feature-first structure.** Each domain feature (`about_me`, `education`, `experience`, `tech_stack`, `profile`, `contact`, `footer`, `app_bar`, `home`) lives under `lib/<feature>/` with its own `model/`, `provider/`, and `ui/` subfolders. UI screens commonly pair with a `*_form_view_model.dart` (a `StateNotifier`) rather than the widget itself owning state.

**Centralized Riverpod providers via `part`/`part of`.** `lib/providers/providers.dart` is the single entry point that declares `appConfigProvider` (an `AppConfigNotifier` gating app readiness as a `bool`) and pulls in each feature's provider file as a `part`, e.g. `part '../about_me/provider/about_me_provider.dart';`. Each feature provider file itself is declared as `part of 'package:sergio_web/providers/providers.dart';`. When adding a new feature provider, follow this same `part`/`part of` pairing and register it in `providers.dart` — don't create a standalone top-level provider file elsewhere.

**Startup data loading.** `main()` initializes a `ProviderContainer`, then calls `appConfigProvider.notifier.initializeData(locale)` before `runApp`. That method initializes Firebase, then fires each feature's `load*Data(locale)` in parallel via `Future.wait`, and flips `appConfigProvider` state to `true` when done. `MyApp` watches `appConfigProvider` and shows `CULoading` until initialization completes, then renders `HomeScreen`.

**Locale-driven JSON content.** `lib/common/data/data_resourses.dart` (`DataResources`) maps each feature + locale (`en`/`es`) to a JSON asset path under `assets/items/`. Feature view models load and parse this JSON rather than fetching from Firestore — Firestore (`lib/common/firestore/firestore_module.dart`) is only used for writing contact form submissions, not for reading site content.

**Shared UI/theme layer.** `lib/common/` holds cross-feature building blocks: `styles/` (theme, text styles, per-component theme files like `cu_button_theme.dart`), `widgets/` (reusable components prefixed `cu_`, e.g. `cu_gradient_button.dart`, `cu_chip.dart`), `icons/`, `helpers/`, and `utils/` (URL launching, clipboard). Prefix convention `cu_` (Curriculum/Custom UI) is used throughout for shared widgets and theme files — follow it for new shared components.

**Localization.** Uses Flutter's `flutter_localizations` + generated `AppLocalizations` (`flutter_gen/gen_l10n`) with ARB source files at `lib/l10n/app_en.arb` and `lib/l10n/app_es.arb`. `pubspec.yaml` has `flutter: generate: true` to trigger codegen on build.
