import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/common/data/data_resourses.dart';
import 'package:sergio_web/education/models/education.dart';

class EducationFormViewModel extends StateNotifier<List<Education>> {
  EducationFormViewModel() : super([]);

  List<Education> get educations => state;

  Future<void> loadEducationData(Locale? locale) async {
    var educationList = await _loadData(locale);
    state = educationList;
  }

  Future<List<Education>> _loadData(Locale? locale) async {
    final rawJsonData =
        DataResources.getEducation(locale: locale?.languageCode ?? 'es');
    final jsonString = await rootBundle.loadString(rawJsonData);
    final decodedData = json.decode(jsonString);

    try {
      final Iterable i = decodedData["data"] as List<dynamic>;
      final jsData = i.map((e) => Education.fromJson(e)).toList();
      final data = List<Education>.from(jsData);
      return data;
    } catch (e) {
      debugPrint('error in load education data $e');
      return [];
    }
  }
}
