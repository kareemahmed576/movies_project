import 'package:injectable/injectable.dart';
import '../../../../movie details/domain/entities/movie_details_entity.dart';
import '../repository/explore_repository.dart';

@injectable
class GetMoviesByGenreUseCase {
  final ExploreRepository _exploreRepository;

  GetMoviesByGenreUseCase(this._exploreRepository);

  Future<List<MovieDetailsEntity>> call(String genre, int page) async {
    return await _exploreRepository.getMoviesByGenre(genre, page);
  }
}