import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../movie details/domain/entities/movie_details_entity.dart';
import '../data/history_list_repository.dart';
import 'history_list_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final HistoryRepository repo;

  HistoryCubit(this.repo) : super(HistoryInitial());

  Future<void> loadHistory({bool showLoading = true}) async {
    if (showLoading) emit(HistoryLoading());

    try {
      final snapshot = await repo.getHistory();
      final movies = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return MovieDetailsEntity(
          id: data['id'] as int?,
          title: data['title'] as String?,
          year: data['year']?.toString() ?? "",
          rating: data['rating']?.toString() ?? "0.0",
          runtime: data['runtime']?.toString() ?? "",
          genres: data['genres'] is List ? List<String>.from(data['genres']) : [],
          summary: data['summary'] as String?,
          imagePath: data['large_cover_image'] as String?,
          trailerUrl: data['trailerUrl'] as String?,
        );
      }).toList();

      emit(HistoryLoaded(movies));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }

  Future<void> addMovie(MovieDetailsEntity movie) async {
    List<MovieDetailsEntity> previousMovies = [];
    if (state is HistoryLoaded) {
      previousMovies = (state as HistoryLoaded).movies;
      emit(HistoryLoaded([...previousMovies, movie]));
    }

    try {
      await repo.addMovie(movie);
      await loadHistory(showLoading: false);
    } catch (e) {
      if (previousMovies.isNotEmpty) emit(HistoryLoaded(previousMovies));
      emit(HistoryError(e.toString()));
    }
  }

  Future<void> removeMovie(int movieId) async {
    List<MovieDetailsEntity> previousMovies = [];
    if (state is HistoryLoaded) {
      previousMovies = (state as HistoryLoaded).movies;
      final updatedMovies = previousMovies.where((m) => m.id != movieId).toList();
      emit(HistoryLoaded(updatedMovies));
    }

    try {
      await repo.removeMovie(movieId);
      await loadHistory(showLoading: false);
    } catch (e) {
      if (previousMovies.isNotEmpty) emit(HistoryLoaded(previousMovies));
      emit(HistoryError(e.toString()));
    }
  }
}