import 'package:injectable/injectable.dart';
import '../../../home tab/data/Api/movie_available.dart';
import '../../../home tab/data/model/movie available/movie_avaliable_model.dart';

abstract class ExploreRemoteDataSource {
  Future<MovieAvalibaleModel> getMoviesByGenre(String genre, int page);
}

@Injectable(as: ExploreRemoteDataSource)
class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  final MovieAvailable _movieService;
  ExploreRemoteDataSourceImpl(this._movieService);

  @override
  Future<MovieAvalibaleModel> getMoviesByGenre(String genre, int page) async {
    return await _movieService.getSectionsMovies(genre, page);
  }
}