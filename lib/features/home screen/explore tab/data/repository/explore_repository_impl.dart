import 'package:injectable/injectable.dart';
import 'package:movies_project/features/movie%20details/domain/entities/movie_details_entity.dart';
import '../../domain/repository/explore_repository.dart';
import '../data%20sources/explore_remote_data_source.dart';

@Injectable(as: ExploreRepository)
class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreRemoteDataSource _remoteDataSource;
  ExploreRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<MovieDetailsEntity>> getMoviesByGenre(String genre, int page) async {
    final model = await _remoteDataSource.getMoviesByGenre(genre, page);

    return model.moviesList?.map((m) => m.toMovieDetailsEntity()).toList() ?? [];
  }
}