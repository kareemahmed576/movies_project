import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../../auth/sign_up_screen/data/data sources/remote/sign_up_remote_data_source.dart';
import '../../movie details/domain/entities/movie_details_entity.dart';

@injectable
class HistoryRepository {
  final SignUpRemoteDataSource dataSource;

  HistoryRepository(this.dataSource);

  Future<void> addMovie(MovieDetailsEntity movie) => dataSource.addMovieToHistory(movie);

  Future<void> removeMovie(int movieId) => dataSource.removeMovieFromHistory(movieId);

  Future<QuerySnapshot> getHistory() => dataSource.getHistory();
}