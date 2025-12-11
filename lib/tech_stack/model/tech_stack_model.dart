class TechStackModel {
  final String name;
  final String iconUrl;

  TechStackModel({required this.name, required this.iconUrl});

  factory TechStackModel.fromJson(Map<String, dynamic> json) {
    return TechStackModel(
      name: json['name'],
      iconUrl: json['icon_url'],
    );
  }
}
