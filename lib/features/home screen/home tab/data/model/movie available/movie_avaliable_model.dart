import 'package:json_annotation/json_annotation.dart';
import '../../../../../movie details/domain/entities/movie_details_entity.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';

part 'movie_avaliable_model.g.dart';

@JsonSerializable()
class MovieAvalibaleModel {
  @JsonKey(name: 'results')
  final List<Movies>? moviesList;
  @JsonKey(name: 'total_pages')
  final int? totalPages;

  MovieAvalibaleModel({this.moviesList, this.totalPages});

  factory MovieAvalibaleModel.fromJson(Map<String, dynamic> json) =>
      _$MovieAvalibaleModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieAvalibaleModelToJson(this);

  MovieAvailableEntity toEntity() {
    return MovieAvailableEntity(
      moviesList?.map((e) => e.toMovieDetailsEntity()).toList() ?? [],
    );
  }
}

@JsonSerializable()
class Movies {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "url")
  final String? url;

  @JsonKey(name: "imdb_code")
  final String? imdbCode;

  @JsonKey(name: "title")
  final String? title;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'vote_average')
  final double? rating;

  @JsonKey(name: 'overview')
  final String? summary;

  @JsonKey(name: "poster_path")
  final String? posterPath;

  @JsonKey(name: "backdrop_path")
  final String? background;

  Movies({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.releaseDate,
    this.rating,
    this.summary,
    this.posterPath,
    this.background,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);

  MovieDetailsEntity toMovieDetailsEntity() {
    return MovieDetailsEntity(
      id: id,
      title: title ?? "Unknown",
      year: (releaseDate != null && releaseDate!.isNotEmpty)
          ? releaseDate!.split('-')[0]
          : "",
      rating: rating?.toStringAsFixed(1) ?? "0.0",
      runtime: "N/A",
      genres: [],
      summary: summary ?? "",
      imagePath: posterPath != null
          ? 'https://image.tmdb.org/t/p/w500$posterPath'
          : 'https://image.tmdb.org/t/p/w500$background',
      trailerUrl: null,
    );
  }
}