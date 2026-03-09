import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import 'package:movies_project/core/resources/internet_connector.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/features/home%20screen/home%20tab/data/model/movie%20available/movie_avaliable_model.dart';
import 'package:movies_project/features/home%20screen/home%20tab/data/source%20data/movie_dao.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/repository/movie_repo.dart';
@Injectable(as:MovieRepo )
class MovieRepoImpl  implements MovieRepo{
  MovieDao movieDao;
  MovieRepoImpl(this.movieDao);
  @override
  Future<BaseResponse<MovieAvailableEntity>> fetchMovies() async{
      bool isConnected= await InternetConnector.checkConnection();
      if(isConnected){
        var response= await movieDao.fetchMovies();
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