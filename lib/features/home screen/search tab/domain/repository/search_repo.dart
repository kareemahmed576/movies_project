import 'package:movies_project/core/resources/base_response.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';

abstract interface class SearchRepo {

  Future<BaseResponse<MovieAvailableEntity>> fetchSources(String search);
}