import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../movie details/domain/entities/movie_details_entity.dart';
import '../../domain/usecase/get_movies_by_genre_use_case.dart';
import 'explore_states.dart';

@injectable
class ExploreCubit extends Cubit<ExploreStates> {
  final GetMoviesByGenreUseCase _getMoviesByGenreUseCase;

  ExploreCubit(this._getMoviesByGenreUseCase) : super(ExploreInitialState());

  int currentPage = 1;
  List<MovieDetailsEntity> allMovies = [];
  bool isFetching = false;

  void getMovies(String genre, {bool isLoadMore = false}) async {
    if (isFetching) return;
    isFetching = true;

    if (!isLoadMore) {
      emit(ExploreLoadingState());
      currentPage = 1;
      allMovies = [];
    }

    try {
      final newMovies = await _getMoviesByGenreUseCase.call(genre, currentPage);

      if (newMovies.isNotEmpty) {
        allMovies.addAll(newMovies);
        currentPage++;
        emit(ExploreSuccessState(List.from(allMovies)));
      }
    } catch (e) {
      if (!isLoadMore) {
        emit(ExploreErrorState(e.toString()));
      }
    } finally {
      isFetching = false;
    }
  }
}