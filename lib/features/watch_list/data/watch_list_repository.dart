import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../auth/sign_up_screen/data/data sources/remote/sign_up_remote_data_source.dart';
import '../../home screen/home tab/data/model/movie available/movie_avaliable_model.dart';
import '../../movie details/domain/entities/movie_details_entity.dart';

@LazySingleton()
class WatchListRepository {
  final SignUpRemoteDataSource remote;

  WatchListRepository(this.remote);

  Future<void> addMovie(MovieDetailsEntity movie) {
    return remote.addMovieToWatchList(movie);
  }

  Future<void> removeMovie(int movieId) {
    return remote.removeMovieFromWatchList(movieId);
  }

  Future<QuerySnapshot> getWatchList() {
    return remote.getWatchList();
  }
}