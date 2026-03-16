import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';
import 'package:movies_project/features/home%20screen/search%20tab/domain/use_case/search_use_case.dart';
import 'package:movies_project/features/home%20screen/search%20tab/presentation/view_model/search_states.dart';
@injectable
class SearchViewModel extends Cubit<SearchStates>{
  SearchUseCase searchUseCase;
  SearchViewModel(this.searchUseCase):super(SearchLoadingState());

  getSoruces(String search)async{
    emit(SearchLoadingState());
    var response=await searchUseCase.call(search);
    switch(response){

      case SuccessState<MovieAvailableEntity>():
        return emit(SearchSuccessState(response.response));
      case ErrorState<MovieAvailableEntity>():
       return emit(SearchErrorState(response.error));
    }
  }
}