import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import 'package:movies_project/core/resources/internet_connector.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';
import 'package:movies_project/features/home%20screen/search%20tab/domain/repository/search_repo.dart';
import '../../../home tab/data/model/movie available/movie_avaliable_model.dart';
import '../data_source/search_dao.dart';

@Injectable(as: SearchRepo)
class SearchRepositoryImpl implements SearchRepo {
  final SearchDao _searchDao;

  SearchRepositoryImpl(this._searchDao);

  @override
  Future<BaseResponse<MovieAvailableEntity>> fetchSources(String search) async {
    bool isConnected = await InternetConnector.checkConnection();
    if (!isConnected) {
      return ErrorState(StringsManager.noInternet);
    }
    var response = await _searchDao.fetchSources(search);

    if (response is SuccessState<MovieAvalibaleModel>) {
      return SuccessState(response.response.toEntity());
    } else if (response is ErrorState<MovieAvalibaleModel>) {
      return ErrorState(response.error);
    }

    return ErrorState("Unknown Error");
  }
}