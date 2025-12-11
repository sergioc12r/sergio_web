part of 'package:sergio_web/providers/providers.dart';

final educationProvider =
    StateNotifierProvider<EducationFormViewModel, List<Education>>((ref) {
  return EducationFormViewModel();
});
