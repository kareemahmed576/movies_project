import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/features/home%20screen/home%20tab/data/Api/movie_available.dart';

import 'package:movies_project/features/home%20screen/home%20tab/data/model/movie%20available/movie_avaliable_model.dart';

import '../source data/movie_dao.dart';

@Injectable(as: MovieDao)
class MovieAvaliableApiImpl implements MovieDao {
  MovieAvailable movieAvailable;

  MovieAvaliableApiImpl(this.movieAvailable);

  @override
  Future<BaseResponse<MovieAvalibaleModel>> fetchMovies() async {
    try {
      var response = await movieAvailable.getAvailableMovies(15);
      return (SuccessState(response));
    } catch (e) {
      return ErrorState(StringsManager.noInternet);
    }
  }

  @override
  Future<BaseResponse<MovieAvalibaleModel>> fetchSections(
    List<String?> gense,
  ) async {
    try {
      var response = await movieAvailable.getSectionsMovies(gense);
      return (SuccessState(response));
    } catch (e) {
      return ErrorState(StringsManager.noInternet);
    }
  }
}
