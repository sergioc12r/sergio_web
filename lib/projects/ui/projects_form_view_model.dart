import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sergio_web/common/data/data_resourses.dart';
import 'package:sergio_web/projects/model/project_model.dart';

class ProjectsFormViewModel extends StateNotifier<List<ProjectModel>> {
  ProjectsFormViewModel() : super([]);

  Future<void> loadProjectsData(Locale? locale) async {
    var projectsList = await _loadData(locale);
    state = projectsList;
  }

  Future<List<ProjectModel>> _loadData(Locale? locale) async {
    final rawJsonData = DataResources.getProjects(
      locale: locale?.languageCode ?? 'es',
    );
    final jsonString = await rootBundle.loadString(rawJsonData);
    final decodedData = json.decode(jsonString);

    try {
      final Iterable i = decodedData["data"] as List<dynamic>;
      final jsData = i.map((e) => ProjectModel.fromJson(e)).toList();
      final data = List<ProjectModel>.from(jsData);
      return data;
    } catch (e) {
      debugPrint('error in load projects data $e');
      return [];
    }
  }
}
