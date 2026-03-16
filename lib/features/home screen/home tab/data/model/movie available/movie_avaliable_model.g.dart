// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_avaliable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieAvalibaleModel _$MovieAvalibaleModelFromJson(Map<String, dynamic> json) =>
    MovieAvalibaleModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieAvalibaleModelToJson(
  MovieAvalibaleModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  movies: (json['movies'] as List<dynamic>?)
      ?.map((e) => Movies.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'movies': instance.movies,
};

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  year: (json['year'] as num?)?.toInt(),
  rating: (json['rating'] as num?)?.toDouble(),
  runtime: (json['runtime'] as num?)?.toInt(),
  genres: (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
  summary: json['summary'] as String?,
  largeCover: json['large_cover_image'] as String?,
  mediumCover: json['medium_cover_image'] as String?,
  background: json['background_image'] as String?,
  trailerCode: json['yt_trailer_code'] as String?,
);

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'year': instance.year,
  'rating': instance.rating,
  'runtime': instance.runtime,
  'genres': instance.genres,
  'summary': instance.summary,
  'large_cover_image': instance.largeCover,
  'medium_cover_image': instance.mediumCover,
  'background_image': instance.background,
  'yt_trailer_code': instance.trailerCode,
};
