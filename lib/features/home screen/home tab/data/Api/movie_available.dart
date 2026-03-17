import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../model/movie available/movie_avaliable_model.dart';

part 'movie_available.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3')
@singleton
abstract class MovieAvailable {
  @factoryMethod
  factory MovieAvailable(Dio dio) = _MovieAvailable;

  @GET("/movie/popular")
  Future<MovieAvalibaleModel> getAvailableMovies(
      @Query("page") int page, {
        @Query("api_key") String apiKey = "40366ca32dca84024cc72b48de9484ad",
      });

  @GET("/discover/movie")
  Future<MovieAvalibaleModel> getSectionsMovies(
      @Query("with_genres") String? genreId,
      @Query("page") int page, {
        @Query("api_key") String apiKey = "40366ca32dca84024cc72b48de9484ad",
        @Query("sort_by") String sortBy = "popularity.desc",
      });

  @GET("/movie/{movie_id}/similar")
  Future<MovieAvalibaleModel> getSimilarMovies(
      @Path("movie_id") int movieId, {
        @Query("api_key") String apiKey = "40366ca32dca84024cc72b48de9484ad",
      });

  @GET("/movie/{movie_id}/videos")
  Future<dynamic> getMovieVideos(
      @Path("movie_id") int movieId, {
        @Query("api_key") String apiKey = "40366ca32dca84024cc72b48de9484ad",
      });
}