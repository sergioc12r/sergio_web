import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/education/models/education.dart';
import 'package:sergio_web/education/view_model/education_form_view_model.dart';
import 'package:sergio_web/experience/model/experience_model.dart';
import 'package:sergio_web/experience/ui/experience_form_view_model.dart';

part '../education/provider/education_provider.dart';
part '../experience/provider/experience_provider.dart';

final appConfigProvider = StateNotifierProvider<AppConfigNotifier, bool>((ref) {
  return AppConfigNotifier(ref);
});

class AppConfigNotifier extends StateNotifier<bool> {
  AppConfigNotifier(this.ref) : super(false);

  final Ref ref;

  Future<void> initializeData(Locale currentLocale) async {
    debugPrint("🤖 Iniciando la carga de configuración global...");

    final edNotifier = ref.read(educationProvider.notifier);
    final expNotifier = ref.read(experienceProvider.notifier);

    final List<Future<void>> futures = [
      edNotifier.loadEducationData(currentLocale),
      expNotifier.loadExperienceData(currentLocale)
    ];

    await Future.wait(futures);

    state = true;

    debugPrint("✅ Configuración inicializada.");
  }
}
