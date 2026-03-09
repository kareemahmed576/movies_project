import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/repository/movie_repo.dart';
@injectable
class MovieAvailableUseCase {
  MovieRepo movieRepo;
  MovieAvailableUseCase(this.movieRepo);
  Future<BaseResponse<MovieAvailableEntity>> call()=>movieRepo.fetchMovies();
}