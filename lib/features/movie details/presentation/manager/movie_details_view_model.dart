import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/use case/get_similar_movies_use_case.dart';
import 'movie_details_states.dart';

@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsStates> {
  final GetSimilarMoviesUseCase _getSimilarMoviesUseCase;

  MovieDetailsViewModel(this._getSimilarMoviesUseCase) : super(MovieDetailsInitialState());

  void getSimilarMovies(int movieId) async {
    emit(SimilarMoviesLoadingState());

    final response = await _getSimilarMoviesUseCase.call(movieId);

    if (response is SuccessState<List<MovieDetailsEntity>>) {
      emit(SimilarMoviesSuccessState(response.response));
    } else if (response is ErrorState<List<MovieDetailsEntity>>) {
      emit(SimilarMoviesErrorState(response.error));
    }
  }
}