import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_project/features/home%20screen/home%20tab/data/model/movie%20available/movie_avaliable_model.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3')
@singleton
abstract class SearchApi {
  @factoryMethod
  factory SearchApi(Dio dio) = _SearchApi;

  @GET("/search/movie")
  Future<MovieAvalibaleModel> getSearchMovie(
      @Query("query") String search, {
        @Query("include_adult") bool includeAdult = false,
        @Query("api_key") String apiKey = "40366ca32dca84024cc72b48de9484ad",
        @Query("language") String language = "en-US",
        @Query("page") int page = 1,
      });
}