import 'package:json_annotation/json_annotation.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entitiy_req.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';
import '../../../../../movie details/domain/entities/movie_details_entity.dart';

part 'movie_avaliable_model.g.dart';

@JsonSerializable()
class MovieAvalibaleModel {
  final String? status;
  final Data? data;

  MovieAvalibaleModel({this.status, this.data});

  factory MovieAvalibaleModel.fromJson(Map<String, dynamic> json) =>
      _$MovieAvalibaleModelFromJson(json);

  MovieAvailableEntity toEntity() {
    return MovieAvailableEntity(
      data?.movies?.map((e) => e.toMovieDetailsEntity()).toList() ?? [],
    );
  }
}

@JsonSerializable()
class Data {
  final List<Movies>? movies;
  Data({this.movies});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
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

  @JsonKey(name: "title_english")
  final String? titleEnglish;

  @JsonKey(name: "title_long")
  final String? titleLong;

  @JsonKey(name: "slug")
  final String? slug;

  @JsonKey(name: "year")
  final int? year;

  @JsonKey(name: "rating")
  final double? rating;

  @JsonKey(name: "runtime")
  final int? runtime;

  @JsonKey(name: "genres")
  final List<String>? genres;

  @JsonKey(name: "summary")
  final String? summary;

  @JsonKey(name: "description_full")
  final String? descriptionFull;

  @JsonKey(name: "synopsis")
  final String? synopsis;

  @JsonKey(name: "yt_trailer_code")
  final String? ytTrailerCode;

  @JsonKey(name: "language")
  final String? language;

  @JsonKey(name: "mpa_rating")
  final String? mpaRating;

  @JsonKey(name: "background_image")
  final String? backgroundImage;

  @JsonKey(name: "background_image_original")
  final String? backgroundImageOriginal;

  @JsonKey(name: "small_cover_image")
  final String? smallCoverImage;

  @JsonKey(name: "medium_cover_image")
  final String? mediumCoverImage;

  @JsonKey(name: "large_cover_image")
  final String? largeCoverImage;

  @JsonKey(name: "state")
  final String? state;

  @JsonKey(name: "date_uploaded")
  final String? dateUploaded;

  @JsonKey(name: "date_uploaded_unix")
  final int? dateUploadedUnix;

  Movies({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);


  MovieAvailableEntitiyReq toEntity() {
    return MovieAvailableEntitiyReq(
      id: id,
      imagePath: largeCoverImage,
      rating: rating,
      gense: genres,
    );
  }

  MovieDetailsEntity toMovieDetailsEntity() {
    return MovieDetailsEntity(
      id: id,
      title: title ?? "Unknown",
      year: year?.toString() ?? "",
      rating: rating?.toString() ?? "0.0",
      runtime: "${runtime ?? 0} min",
      genres: genres ?? [],
      summary: summary ?? "",
      imagePath:  largeCoverImage,
      trailerUrl: (ytTrailerCode != null && ytTrailerCode!.isNotEmpty)
          ? "https://www.youtube.com/watch?v=$ytTrailerCode"
          : null,
    );
  }
}