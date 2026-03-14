import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';
import 'package:movies_project/features/home%20screen/search%20tab/domain/repository/search_repo.dart';
@singleton
class SearchUseCase {
  SearchRepo searchRepo;
  SearchUseCase(this.searchRepo);

  Future<BaseResponse<MovieAvailableEntity>> call(String search)=>searchRepo.fetchSources(search);
}