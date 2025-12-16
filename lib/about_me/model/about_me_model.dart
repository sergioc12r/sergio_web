import 'package:flutter/material.dart';

class AboutMeModel {
  final String title;
  final String subTitle;
  final String description;
  final String imageUrl;
  final List<String> techItems;
  final List<RelevantItemModel> relevantItems;

  const AboutMeModel(
      {required this.title,
      required this.subTitle,
      required this.description,
      required this.imageUrl,
      required this.techItems,
      required this.relevantItems});

  factory AboutMeModel.fromJson(Map<String, dynamic> json) {
    List<RelevantItemModel> relevantItems = [];
    List<String> techItems = [];
    try {
      Iterable i = json["relevant_items"];
      relevantItems = i.map((e) => RelevantItemModel.fromJson(e)).toList();
      Iterable j = json["tech_items"];
      techItems = j.map((e) => e.toString()).toList();
    } catch (e) {
      debugPrint('error in aboutMeModel $e');
    }

    return AboutMeModel(
        title: json['title'],
        subTitle: json["sub_title"],
        description: json["description"],
        imageUrl: json["image"] ?? '',
        techItems: techItems,
        relevantItems: relevantItems);
  }
}

class RelevantItemModel {
  final String title;
  final String subTitle;
  final String iconUrl;

  const RelevantItemModel(
      {required this.title, required this.subTitle, required this.iconUrl});

  factory RelevantItemModel.fromJson(Map<String, dynamic> json) {
    return RelevantItemModel(
        title: json['title'],
        subTitle: json["sub_title"],
        iconUrl: json["icon_url"]);
  }
}
