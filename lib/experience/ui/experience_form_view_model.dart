import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/common/data/data_resourses.dart';
import 'package:sergio_web/experience/model/experience_model.dart';

class ExperienceFormViewModel extends StateNotifier<List<ExperienceModel>> {
  ExperienceFormViewModel() : super([]);

  Future<void> loadExperienceData(Locale? locale) async {
    var educationList = await _loadData(locale);
    state = educationList;
  }

  Future<List<ExperienceModel>> _loadData(Locale? locale) async {
    final rawJsonData =
        DataResources.getExperience(locale: locale?.languageCode ?? 'es');
    final jsonString = await rootBundle.loadString(rawJsonData);
    final decodedData = json.decode(jsonString);

    try {
      final Iterable i = decodedData["data"] as List<dynamic>;
      final jsData = i.map((e) => ExperienceModel.fromJson(e)).toList();
      final data = List<ExperienceModel>.from(jsData);
      return data;
    } catch (e) {
      debugPrint('error in load experiences data $e');
      return [];
    }
  }
}
