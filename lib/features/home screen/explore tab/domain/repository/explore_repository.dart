import 'package:movies_project/features/movie%20details/domain/entities/movie_details_entity.dart';

abstract class ExploreRepository {
  Future<List<MovieDetailsEntity>> getMoviesByGenre(String genre, int page);
}