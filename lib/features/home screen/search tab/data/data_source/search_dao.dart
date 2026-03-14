import 'package:movies_project/core/resources/base_response.dart';
import 'package:movies_project/features/home%20screen/home%20tab/data/model/movie%20available/movie_avaliable_model.dart';

abstract interface class SearchDao {

 Future<BaseResponse<MovieAvalibaleModel>> fetchSources(String search);
}