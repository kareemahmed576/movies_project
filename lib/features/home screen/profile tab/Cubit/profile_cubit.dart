
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/Cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit():super(WatchListState());

  void setHistoryState(){
    emit(HistoryState());
  }

  void setWatchListState(){
    emit(WatchListState());
  }

}