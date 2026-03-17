import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/features/home%20screen/home%20tab/data/model/movie%20available/movie_avaliable_model.dart';
import 'package:movies_project/features/home%20screen/search%20tab/data/Api/search_api.dart';
import 'package:movies_project/features/home%20screen/search%20tab/data/data_source/search_dao.dart';

@Injectable(as: SearchDao)
class SearchApiImpl implements SearchDao {
  final SearchApi searchApi;

  SearchApiImpl(this.searchApi);

  @override
  Future<BaseResponse<MovieAvalibaleModel>> fetchSources(String search) async {
    try {
      var response = await searchApi.getSearchMovie(search);
      return SuccessState(response);
    } catch (e) {
      return ErrorState(e.toString());
    }
  }
}