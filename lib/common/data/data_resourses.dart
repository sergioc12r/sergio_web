class DataResources {
  /// Education data
  static const String _enEducation = "assets/items/en/education.json";
  static const String _esEducation = "assets/items/es/education.json";

  static String getEducation({String locale = 'es_ES'}) {
    if (locale == 'es_ES') {
      return _esEducation;
    } else {
      return _enEducation;
    }
  }

  /// Experience data
  static const String _enExperience = "assets/items/en/experience.json";
  static const String _esExperience = "assets/items/es/experience.json";

  static String getExperience({String locale = 'es_ES'}) {
    if (locale == 'es_ES') {
      return _esExperience;
    } else {
      return _enExperience;
    }
  }
}
