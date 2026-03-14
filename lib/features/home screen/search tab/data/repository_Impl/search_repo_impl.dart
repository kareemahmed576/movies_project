import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import 'package:movies_project/core/resources/internet_connector.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/features/home%20screen/home%20tab/data/model/movie%20available/movie_avaliable_model.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';
import 'package:movies_project/features/home%20screen/search%20tab/data/data_source/search_dao.dart';
import 'package:movies_project/features/home%20screen/search%20tab/domain/repository/search_repo.dart';
@Injectable(as:SearchRepo )
class SearchRepoImpl implements SearchRepo{
  SearchDao searchDao;
  SearchRepoImpl(this.searchDao);
  @override
  Future<BaseResponse<MovieAvailableEntity>> fetchSources(String search) async{
    bool isConnected= await InternetConnector.checkConnection();
    if(isConnected){
      var response=await searchDao.fetchSources(search);
      switch(response){
        case SuccessState<MovieAvalibaleModel>():
          return SuccessState(response.response.toEntity());
        case ErrorState<MovieAvalibaleModel>():
          return ErrorState(response.error);
      }
    }else{
      return ErrorState(StringsManager.noInternet);
    }
  }
}