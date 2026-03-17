import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_project/features/watch_list/Cubit/watch_list_state.dart';

import '../../home screen/home tab/data/model/movie available/movie_avaliable_model.dart';
import '../../movie details/domain/entities/movie_details_entity.dart';
import '../data/watch_list_repository.dart';

@injectable
class WatchListCubit extends Cubit<WatchState> {
  final WatchListRepository repo;

  WatchListCubit(this.repo) : super(WatchListInitial());

  Future<void> loadWatchList() async {
    emit(WatchListLoading());

    try {
      final snapshot = await repo.getWatchList();

      final movies = snapshot.docs
          .map((doc) => MovieDetailsEntity.fromJson(
          doc.data() as Map<String, dynamic>))
          .toList();

      emit(WatchListLoaded(movies));
    } catch (e) {
      emit(WatchListError(e.toString()));
    }
  }
  Future<void> addMovie(MovieDetailsEntity movie) async {
    await repo.addMovie(movie);
    await loadWatchList(); // refresh
  }

  Future<void> removeMovie(int movieId) async {
    await repo.removeMovie(movieId);
    await loadWatchList(); // refresh
  }
}