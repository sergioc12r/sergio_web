import 'package:flutter/material.dart';

class Education {
  final String title;
  final String place;
  final String description;
  final EducationType educationType;
  final DateTime finishDate;

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      title: json['title'] as String,
      place: json['place'] as String,
      description: json['description'] as String,
      educationType: _stringToEducationType(json['education_type']),
      finishDate: DateTime.parse(json['finish_year']),
    );
  }

  IconData get iconData {
    switch (educationType) {
      case EducationType.degree:
        return Icons.school_outlined;
      case EducationType.shortCourse:
        return Icons.code;
      case EducationType.largeCourse:
        return Icons.book_outlined;
    }
  }

  bool get isDegree => educationType == EducationType.degree;

  Education(
      {required this.title,
      required this.place,
      required this.description,
      required this.educationType,
      required this.finishDate});
}

enum EducationType { degree, shortCourse, largeCourse }

EducationType _stringToEducationType(String type) {
  switch (type) {
    case 'degree':
      return EducationType.degree;
    case 'shortCourse':
      return EducationType.shortCourse;
    case 'largeCourse':
      return EducationType.largeCourse;
    default:
      throw ArgumentError('Invalid Json $type');
  }
}
