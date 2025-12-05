class ExperienceModel {
  final String title;
  final String company;
  final String description;
  final bool isCurrent;
  final DateTime initDate;
  final DateTime endDate;

  ExperienceModel(
      {required this.title,
      required this.company,
      required this.description,
      required this.isCurrent,
      required this.initDate,
      required this.endDate});
}
