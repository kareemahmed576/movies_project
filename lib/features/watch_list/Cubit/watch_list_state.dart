import '../../movie details/domain/entities/movie_details_entity.dart';

abstract class WatchState {}

class WatchListInitial extends WatchState {}

class WatchListLoading extends WatchState {}

class WatchListLoaded extends WatchState {
  final List<MovieDetailsEntity> movies;

  WatchListLoaded(this.movies);
}

class WatchListError extends WatchState {
  final String message;

  WatchListError(this.message);
}