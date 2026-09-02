class TechStackModel {
  final String name;
  final String iconUrl;

  /// Nullable on purpose: the field was added to `tech_stack.json` after the
  /// fact, so an unclassified entry must not break parsing. Anything without
  /// a category is filed under [fallbackCategory] at render time.
  final String? category;

  const TechStackModel({
    required this.name,
    required this.iconUrl,
    this.category,
  });

  /// Where uncategorised entries land.
  static const String fallbackCategory = 'herramientas';

  /// The order the columns are printed in, coarse to fine: what you write in,
  /// what you ship, what it talks to, what you use to do it.
  static const List<String> categoryOrder = <String>[
    'lenguajes',
    'mobile',
    'backend',
    fallbackCategory,
  ];

  String get resolvedCategory {
    final String? value = category;
    if (value == null || value.isEmpty) {
      return fallbackCategory;
    }
    return value;
  }

  factory TechStackModel.fromJson(Map<String, dynamic> json) {
    return TechStackModel(
      name: json['name'],
      iconUrl: json['icon_url'],
      category: json['category'] as String?,
    );
  }
}
