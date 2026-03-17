import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import '../../../home screen/home tab/domain/repository/movie_repo.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/use case/get_similar_movies_use_case.dart';
import 'movie_details_states.dart';

@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsState> {
  final GetSimilarMoviesUseCase _getSimilarMoviesUseCase;
  final MovieRepo _movieRepo;

  MovieDetailsViewModel(this._getSimilarMoviesUseCase, this._movieRepo)
      : super(MovieDetailsState());

  void getSimilarMovies(int movieId) async {
    emit(state.copyWith(isSimilarLoading: true));
    final response = await _getSimilarMoviesUseCase.call(movieId);

    if (response is SuccessState<List<MovieDetailsEntity>>) {
      emit(state.copyWith(isSimilarLoading: false, similarMovies: response.response));
    } else if (response is ErrorState<List<MovieDetailsEntity>>) {
      emit(state.copyWith(isSimilarLoading: false, errorMessage: response.error));
    }
  }

  void getMovieTrailer(int movieId) async {
    emit(state.copyWith(isTrailerLoading: true));
    var response = await _movieRepo.fetchTrailer(movieId);

    if (response is SuccessState<String>) {
      emit(state.copyWith(isTrailerLoading: false, trailerUrl: response.response));
    } else {
      emit(state.copyWith(isTrailerLoading: false));
    }
  }
}