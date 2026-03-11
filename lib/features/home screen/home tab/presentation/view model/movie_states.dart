import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';

sealed class MovieStates {}

class MovieSuccessState extends MovieStates{
  MovieAvailableEntity movieAvailableEntity;
  MovieSuccessState(this.movieAvailableEntity);
}
class MovieLoadingState extends MovieStates{}
class MovieErrorState extends MovieStates{
  String error;
  MovieErrorState(this.error);
}
