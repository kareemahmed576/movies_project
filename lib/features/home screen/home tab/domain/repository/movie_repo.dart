import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';

import '../../../../../core/resources/base_response.dart';

abstract interface class MovieRepo {
  Future<BaseResponse<MovieAvailableEntity>> fetchMovies();
}