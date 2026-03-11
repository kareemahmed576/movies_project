import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';

sealed class SectionStates {}

class SectionSuccessState extends SectionStates{
  MovieAvailableEntity movieAvailableEntity;
  SectionSuccessState(this.movieAvailableEntity);
}
class SectionLoadingState extends SectionStates{}
class SectionErrorState extends SectionStates{
  String error;
  SectionErrorState(this.error);
}
