class MovieDetailsEntity {
  final int? id;
  final String? title;
  final String? year;
  final String? trailerUrl;
  final String? rating;
  final String? runtime;
  final List<String>? genres;
  final String? summary;
  final String? imagePath;

  MovieDetailsEntity({
    this.id,
    this.title,
    this.year,
    this.trailerUrl,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.imagePath,
  });



  factory MovieDetailsEntity.fromJson(Map<String, dynamic> json) {
    return MovieDetailsEntity(
      id: json['movieId'],
      title: json['title'],
      year: json['year'],
      trailerUrl: json['trailerUrl'],
      rating: json['rating'],
      runtime: json['runtime'],
      genres: json['genres'] != null
          ? List<String>.from(json['genres'])
          : [],
      summary: json['summary'],
      imagePath: json['image'],
    );
  }




  Map<String, dynamic> toJson() {
    return {
      "movieId": id,
      "title": title,
      "image": imagePath,
      "rating": rating,
      "year": year,
      "runtime": runtime,
      "genres": genres,
      "summary": summary,
      "trailerUrl": trailerUrl,
    };
  }


}