class ProjectModel {
  final String title;
  final String description;
  final List<String> tags;

  /// URL-safe identifier, e.g. `sitp-smart`. Used to build routes like
  /// `/projects/:slug/privacy-policy` — not translated, same in every locale.
  final String slug;

  /// Real, project-specific legal documents (Terms, Privacy Policy, EULA...).
  /// Empty for projects that only have the generic privacy-policy template
  /// — the UI falls back to `/projects/:slug/privacy-policy` in that case.
  final List<ProjectLegalLink> legalLinks;

  /// Bundled asset path for the card's image. Null falls back to
  /// [CUStripedPlaceholder] — most projects don't have a screenshot yet.
  final String? imageAssetPath;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.tags,
    required this.slug,
    this.legalLinks = const [],
    this.imageAssetPath,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    final Iterable rawTags = json['tags'] as List<dynamic>? ?? const [];
    final Iterable rawLegalLinks =
        json['legalLinks'] as List<dynamic>? ?? const [];

    return ProjectModel(
      title: json['title'] as String,
      description: json['description'] as String,
      tags: rawTags.map((e) => e as String).toList(),
      slug: json['slug'] as String,
      legalLinks: rawLegalLinks
          .map((e) => ProjectLegalLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageAssetPath: json['imageAssetPath'] as String?,
    );
  }
}

/// One directly-linkable legal document for a project, e.g. its real Terms
/// of Service or EULA — as opposed to the generic privacy-policy template.
class ProjectLegalLink {
  final String label;
  final String path;

  const ProjectLegalLink({required this.label, required this.path});

  factory ProjectLegalLink.fromJson(Map<String, dynamic> json) {
    return ProjectLegalLink(
      label: json['label'] as String,
      path: json['path'] as String,
    );
  }
}
