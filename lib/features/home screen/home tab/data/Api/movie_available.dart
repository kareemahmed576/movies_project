import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_project/features/home%20screen/home%20tab/data/model/movie%20available/movie_avaliable_model.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_available.g.dart';

@RestApi(baseUrl: 'https://movies-api.accel.li')
@singleton
abstract class MovieAvailable {
  @factoryMethod
  factory MovieAvailable(Dio dio) = _MovieAvailable;

  @GET("/api/v2/list_movies.json")
  Future<MovieAvalibaleModel> getAvailableMovies(
      @Query("limit") int limit, {
        @Query("sort_by") String? sortBy,
        @Query("order_by") String? orderBy,
      });

  @GET("/api/v2/list_movies.json")
  Future<MovieAvalibaleModel> getSectionsMovies(@Query("genre") String? genre);

  @GET("/api/v2/movie_suggestions.json")
  Future<MovieAvalibaleModel> getSimilarMovies(@Query("movie_id") int movieId);
}