import 'package:movies_project/features/movie%20details/domain/entities/movie_details_entity.dart';

abstract class ExploreStates {}

class ExploreInitialState extends ExploreStates {}

class ExploreLoadingState extends ExploreStates {}

class ExploreSuccessState extends ExploreStates {
  final List<MovieDetailsEntity> movies;
  ExploreSuccessState(this.movies);
}

class ExploreErrorState extends ExploreStates {
  final String message;
  ExploreErrorState(this.message);
}