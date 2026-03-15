import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import '../entities/movie_details_entity.dart';
import '../repositories/movie_details_repo.dart';

@injectable
class GetSimilarMoviesUseCase {
  final MovieDetailsRepo repository;

  GetSimilarMoviesUseCase(this.repository);

  Future<BaseResponse<List<MovieDetailsEntity>>> call(List<String?> genres) {
    return repository.fetchSimilarMovies(genres);
  }
}