import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import 'package:movies_project/core/resources/internet_connector.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/features/home%20screen/home%20tab/data/model/movie%20available/movie_avaliable_model.dart';
import 'package:movies_project/features/home%20screen/home%20tab/data/source%20data/movie_dao.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/repositories/movie_details_repo.dart';

@Injectable(as: MovieDetailsRepo)
class MovieDetailsRepoImpl implements MovieDetailsRepo {
  final MovieDao movieDao;

  MovieDetailsRepoImpl(this.movieDao);

  @override
  Future<BaseResponse<List<MovieDetailsEntity>>> fetchSimilarMovies(int movieId) async {
    bool isConnected = await InternetConnector.checkConnection();
    if (isConnected) {
      var response = await movieDao.fetchSimilarMovies(movieId);

      if (response is SuccessState<MovieAvalibaleModel>) {
        var detailsList = response.response.moviesList
            ?.map((m) => m.toMovieDetailsEntity())
            .toList() ?? [];
        return SuccessState(detailsList);
      } else if (response is ErrorState<MovieAvalibaleModel>) {
        return ErrorState(response.error);
      }
    }
    return ErrorState(StringsManager.noInternet);
  }
}