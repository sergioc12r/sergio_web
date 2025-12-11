import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/common/data/data_resourses.dart';
import 'package:sergio_web/tech_stack/model/tech_stack_model.dart';

class TechStackFormViewModel extends StateNotifier<List<TechStackModel>> {
  TechStackFormViewModel() : super([]);

  Future<void> loadExperienceData(Locale? locale) async {
    var stackList = await _loadData(locale);
    state = stackList;
  }

  Future<List<TechStackModel>> _loadData(Locale? locale) async {
    final rawJsonData = DataResources.getTechStack();
    final jsonString = await rootBundle.loadString(rawJsonData);
    final decodedData = json.decode(jsonString);

    try {
      final Iterable i = decodedData["data"] as List<dynamic>;
      final jsData = i.map((e) => TechStackModel.fromJson(e)).toList();
      final data = List<TechStackModel>.from(jsData);
      return data;
    } catch (e) {
      debugPrint('error in load experiences data $e');
      return [];
    }
  }
}
