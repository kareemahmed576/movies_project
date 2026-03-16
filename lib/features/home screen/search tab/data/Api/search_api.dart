import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:movies_project/features/home%20screen/home%20tab/data/model/movie%20available/movie_avaliable_model.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api.g.dart';
@RestApi(baseUrl: 'https://movies-api.accel.li/api/v2')
@singleton
abstract class SearchApi {
  @factoryMethod
  factory SearchApi(Dio dio) = _SearchApi;
  @GET("/list_movies.json")
  Future<MovieAvalibaleModel> getSearchMovie(@Query("query_term") String search);
}