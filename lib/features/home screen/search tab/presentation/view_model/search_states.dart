import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';

sealed class SearchStates {}

class SearchInitialState extends SearchStates {}
class SearchLoadingState extends SearchStates {}
class SearchSuccessState extends SearchStates {
  final MovieAvailableEntity response;
  SearchSuccessState(this.response);
}
class SearchErrorState extends SearchStates {
  final String error;
  SearchErrorState(this.error);
}