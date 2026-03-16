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
  final int? id;
  final String? title;
  final int? year;
  final double? rating;
  final int? runtime;
  final List<String>? genres;
  final String? summary;
  @JsonKey(name: "large_cover_image")
  final String? largeCover;
  @JsonKey(name: "medium_cover_image")
  final String? mediumCover;
  @JsonKey(name: "background_image")
  final String? background;
  @JsonKey(name: "yt_trailer_code")
  final String? trailerCode;

  Movies({
    this.id, this.title, this.year, this.rating, this.runtime,
    this.genres, this.summary, this.largeCover, this.mediumCover,
    this.background, this.trailerCode,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);


  MovieAvailableEntitiyReq toEntity() {
    return MovieAvailableEntitiyReq(
      id: id,
      imagePath: mediumCover ?? largeCover ?? background,
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
      imagePath: largeCover ?? mediumCover ?? background,
      trailerUrl: (trailerCode != null && trailerCode!.isNotEmpty)
          ? "https://www.youtube.com/watch?v=$trailerCode"
          : null,
    );
  }
}