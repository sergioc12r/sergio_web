part of 'package:sergio_web/providers/providers.dart';

final projectsProvider =
    StateNotifierProvider<ProjectsFormViewModel, List<ProjectModel>>((ref) {
      return ProjectsFormViewModel();
    });
