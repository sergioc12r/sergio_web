part of 'package:sergio_web/providers/providers.dart';

final aboutMeProvider =
    StateNotifierProvider<AboutMeFormViewModel, AboutMeModel?>((ref) {
  return AboutMeFormViewModel();
});
