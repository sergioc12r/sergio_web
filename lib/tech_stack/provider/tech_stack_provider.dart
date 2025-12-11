part of 'package:sergio_web/providers/providers.dart';

final techStackProvider =
    StateNotifierProvider<TechStackFormViewModel, List<TechStackModel>>((ref) {
  return TechStackFormViewModel();
});
