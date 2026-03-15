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

  void getSimilarMovies(List<String?> genres) async {
    emit(SimilarMoviesLoadingState());

    final response = await _getSimilarMoviesUseCase.call(genres);

    switch (response) {
      case SuccessState<List<MovieDetailsEntity>>():
        emit(SimilarMoviesSuccessState(response.response));
      case ErrorState<List<MovieDetailsEntity>>():
        emit(SimilarMoviesErrorState(response.error));
    }
  }
}