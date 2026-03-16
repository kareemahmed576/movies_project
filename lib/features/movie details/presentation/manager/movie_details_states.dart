import '../../domain/entities/movie_details_entity.dart';

sealed class MovieDetailsStates {}

class MovieDetailsInitialState extends MovieDetailsStates {}

class SimilarMoviesLoadingState extends MovieDetailsStates {}

class SimilarMoviesSuccessState extends MovieDetailsStates {
  final List<MovieDetailsEntity> similarMovies;
  SimilarMoviesSuccessState(this.similarMovies);
}

class SimilarMoviesErrorState extends MovieDetailsStates {
  final String message;
  SimilarMoviesErrorState(this.message);
}