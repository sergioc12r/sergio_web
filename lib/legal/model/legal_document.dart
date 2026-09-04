/// One published legal document for a project: its display title and the
/// markdown asset it renders from.
class LegalDocument {
  const LegalDocument({required this.title, required this.assetPath});

  final String title;
  final String assetPath;
}
