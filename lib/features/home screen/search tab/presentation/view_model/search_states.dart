import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';

sealed class SearchStates {}

class SearchSuccessState extends SearchStates{
  MovieAvailableEntity response;
  SearchSuccessState(this.response);
}
class SearchLoadingState extends SearchStates{}
class SearchErrorState extends SearchStates{
  String error;
  SearchErrorState(this.error);
}
