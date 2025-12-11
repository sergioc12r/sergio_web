class ExperienceModel {
  final String title;
  final String company;
  final String description;
  final bool isCurrent;
  final DateTime initDate;
  final DateTime endDate;
  final List<ExperienceSkillModel>? skills;
  final List<ExperienceActivitiesModel>? activities;

  ExperienceModel(
      {required this.title,
      required this.company,
      required this.description,
      required this.isCurrent,
      required this.initDate,
      required this.endDate,
      this.skills,
      this.activities});

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
        title: json['title'],
        company: json['company'],
        description: json['description'],
        isCurrent: json['isCurrent'],
        initDate: DateTime.parse(json['initDate']),
        endDate: DateTime.parse(json['endDate']),
        skills: json['skills'].map<ExperienceSkillModel>((e) {
          return ExperienceSkillModel.fromJson(e);
        }).toList(),
        activities: json['activities'].map<ExperienceActivitiesModel>((e) {
          return ExperienceActivitiesModel.fromJson(e);
        }).toList());
  }
}

/// Model of skill to show in [Chip] widget
class ExperienceSkillModel {
  final String title;
  final String? svgUrl;

  ExperienceSkillModel({required this.title, this.svgUrl});

  factory ExperienceSkillModel.fromJson(Map<String, dynamic> json) {
    return ExperienceSkillModel(
        title: json['title'], svgUrl: json['svgUrl'] ?? '');
  }
}

/// Model of activities in jobs to show in item list
class ExperienceActivitiesModel {
  final String body;

  ExperienceActivitiesModel({required this.body});

  factory ExperienceActivitiesModel.fromJson(Map<String, dynamic> json) {
    return ExperienceActivitiesModel(body: json['body']);
  }
}
