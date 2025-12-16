import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/about_me/model/about_me_model.dart';
import 'package:sergio_web/common/data/data_resourses.dart';

class AboutMeFormViewModel extends StateNotifier<AboutMeModel?> {
  AboutMeFormViewModel() : super(null);

  Future<void> loadAboutMeData(Locale? locale) async {
    var aboutMeInfo = await _loadData(locale);
    state = aboutMeInfo;
  }

  Future<AboutMeModel?> _loadData(Locale? locale) async {
    final rawJsonData =
        DataResources.getAboutMeData(locale: locale?.languageCode ?? 'es');
    final jsonString = await rootBundle.loadString(rawJsonData);
    final decodedData = json.decode(jsonString);

    try {
      final data = decodedData["data"];
      final model = AboutMeModel.fromJson(data);
      return model;
    } catch (e) {
      debugPrint('error in load about me data $e');
      return null;
    }
  }
}
