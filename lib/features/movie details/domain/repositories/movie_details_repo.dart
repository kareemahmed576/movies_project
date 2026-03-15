import 'package:movies_project/core/resources/base_response.dart';
import '../entities/movie_details_entity.dart';

abstract class MovieDetailsRepo {
  Future<BaseResponse<List<MovieDetailsEntity>>> fetchSimilarMovies(List<String?> genres);
}