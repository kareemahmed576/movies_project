// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_avaliable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieAvalibaleModel _$MovieAvalibaleModelFromJson(Map<String, dynamic> json) =>
    MovieAvalibaleModel(
      moviesList: (json['results'] as List<dynamic>?)
          ?.map((e) => Movies.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieAvalibaleModelToJson(
  MovieAvalibaleModel instance,
) => <String, dynamic>{
  'results': instance.moviesList,
  'total_pages': instance.totalPages,
};

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  releaseDate: json['release_date'] as String?,
  rating: (json['vote_average'] as num?)?.toDouble(),
  summary: json['overview'] as String?,
  posterPath: json['poster_path'] as String?,
  background: json['backdrop_path'] as String?,
);

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'release_date': instance.releaseDate,
  'vote_average': instance.rating,
  'overview': instance.summary,
  'poster_path': instance.posterPath,
  'backdrop_path': instance.background,
};
