class DataResources {
  /// Education data
  static const String _enEducation = "assets/items/en/education.json";
  static const String _esEducation = "assets/items/es/education.json";

  static const String _esCode = 'ES';

  static String getEducation({String locale = '_esCode'}) {
    if (locale.toUpperCase().contains(_esCode)) {
      return _esEducation;
    } else {
      return _enEducation;
    }
  }

  /// Experience data
  static const String _enExperience = "assets/items/en/experience.json";
  static const String _esExperience = "assets/items/es/experience.json";

  static String getExperience({String locale = '_esCode'}) {
    if (locale.toUpperCase().contains(_esCode)) {
      return _esExperience;
    } else {
      return _enExperience;
    }
  }

  /// Tech stack data
  static const String _techStack = "assets/items/tech_stack.json";

  static String getTechStack() => _techStack;
}
