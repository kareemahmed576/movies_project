import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import 'package:movies_project/features/home%20screen/home%20tab/data/model/movie%20available/movie_avaliable_model.dart';
import '../Api/movie_available.dart';
import '../source data/movie_dao.dart';

@Injectable(as: MovieDao)
class MovieDaoImpl implements MovieDao {
  final MovieAvailable movieAvailable;

  MovieDaoImpl(this.movieAvailable);

  @override
  Future<BaseResponse<MovieAvalibaleModel>> fetchMovies({
    int limit = 20,
    String? sortBy,
    String? orderBy,
  }) async {
    try {
      var response = await movieAvailable.getAvailableMovies(
        limit,
        sortBy: sortBy,
        orderBy: orderBy,
      );
      return SuccessState(response);
    } catch (e) {
      return ErrorState(e.toString());
    }
  }

  @override
  Future<BaseResponse<MovieAvalibaleModel>> fetchSections(List<String?> gense) async {
    try {
      var response = await movieAvailable.getSectionsMovies(gense.first, 1);
      return SuccessState(response);
    } catch (e) {
      return ErrorState(e.toString());
    }
  }

  @override
  Future<BaseResponse<MovieAvalibaleModel>> fetchSimilarMovies(int movieId) async {
    try {
      var response = await movieAvailable.getSimilarMovies(movieId);
      return SuccessState(response);
    } catch (e) {
      return ErrorState(e.toString());
    }
  }
}