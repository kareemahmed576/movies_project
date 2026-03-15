class MovieDetailsEntity {
  final int? id;
  final String? title;
  final String? year;
  final String? rating;
  final String? runtime;
  final List<String>? genres;
  final String? summary;
  final String? imagePath;

  MovieDetailsEntity({
    this.id,
    this.title,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.imagePath,
  });
}