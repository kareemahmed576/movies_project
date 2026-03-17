import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_project/features/watch_list/Cubit/watch_list_state.dart';
import '../../movie details/domain/entities/movie_details_entity.dart';
import '../data/watch_list_repository.dart';

@injectable
class WatchListCubit extends Cubit<WatchState> {
  final WatchListRepository repo;

  WatchListCubit(this.repo) : super(WatchListInitial());

  Future<void> loadWatchList({bool showLoading = true}) async {
    if (showLoading) emit(WatchListLoading());

    try {
      final snapshot = await repo.getWatchList();
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

      emit(WatchListLoaded(movies));
    } catch (e) {
      emit(WatchListError(e.toString()));
    }
  }

  Future<void> addMovie(MovieDetailsEntity movie) async {
    List<MovieDetailsEntity> previousMovies = [];
    if (state is WatchListLoaded) {
      previousMovies = (state as WatchListLoaded).movies;
      emit(WatchListLoaded([...previousMovies, movie]));
    }

    try {
      await repo.addMovie(movie);
      await loadWatchList(showLoading: false);
    } catch (e) {
      emit(WatchListLoaded(previousMovies));
      emit(WatchListError(e.toString()));
    }
  }

  Future<void> removeMovie(int movieId) async {
    List<MovieDetailsEntity> previousMovies = [];
    if (state is WatchListLoaded) {
      previousMovies = (state as WatchListLoaded).movies;
      final updatedMovies = previousMovies.where((m) => m.id != movieId).toList();
      emit(WatchListLoaded(updatedMovies));
    }

    try {
      await repo.removeMovie(movieId);
      await loadWatchList(showLoading: false);
    } catch (e) {
      emit(WatchListLoaded(previousMovies));
      emit(WatchListError(e.toString()));
    }
  }
}