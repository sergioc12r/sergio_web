part of 'package:sergio_web/providers/providers.dart';

final experienceProvider =
    StateNotifierProvider<ExperienceFormViewModel, List<ExperienceModel>>(
        (ref) {
  return ExperienceFormViewModel();
});
