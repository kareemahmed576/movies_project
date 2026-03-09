import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/resources/assets_manager.dart';

class SelectedAvatarCubit extends Cubit<String> {
  SelectedAvatarCubit() : super(AssetsManager.avatar8);

  void selectAvatar(String avatar) {
    emit(avatar);
  }
}