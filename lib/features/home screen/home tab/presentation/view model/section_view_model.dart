import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/useCases/section_use_case.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/view%20model/movie_states.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/view%20model/section_states.dart';
@injectable
class SectionViewModel extends Cubit<SectionStates>{
  SectionUseCase sectionUseCase;
  SectionViewModel(this.sectionUseCase):super(SectionLoadingState());

  getCategories(List<String?> gense)async{
    emit(SectionLoadingState());
    var response=  await sectionUseCase.call(gense: gense);
    switch(response){

      case SuccessState<MovieAvailableEntity>():
       return emit(SectionSuccessState(response.response));
      case ErrorState<MovieAvailableEntity>():
        return emit(SectionErrorState(response.error));
    }
  }
}