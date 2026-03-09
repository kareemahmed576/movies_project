import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/base_response.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/useCases/movie_available_use_case.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/view%20model/movie_states.dart';
@injectable
class MovieViewModel extends Cubit<MovieStates>{
  MovieViewModel(this.movieAvailableUseCase):super(MovieLoadingState());
  MovieAvailableUseCase movieAvailableUseCase;
  getMovies()async{
    emit(MovieLoadingState());
   var response= await movieAvailableUseCase.call();
   switch(response){
     case SuccessState<MovieAvailableEntity>():
       return emit(MovieSuccessState(response.response));
     case ErrorState<MovieAvailableEntity>():
       return emit(MovieErrorState(response.error));
   }
  }
}