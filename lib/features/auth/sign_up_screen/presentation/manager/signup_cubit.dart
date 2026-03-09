import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_project/features/auth/sign_up_screen/presentation/manager/signup_state.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/use case/use_case.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignUpUseCase signUpUseCase;

  @factoryMethod
  SignupCubit(this.signUpUseCase) : super(SignupInitial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String avatar,
  }) async {
    emit(SignupLoading());

    final result = await signUpUseCase.call(
      name: name,
      email: email,
      password: password,
      phone: phone,
      avatar: avatar,
    );

    if (result is UserEntity) {
      emit(SignupSuccess(result));
    } else if (result is String) {
      emit(SignupError(result));
    }
  }
}