import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/result.dart';
import 'package:movies_project/features/auth/forget_password_screen/domain/use_case/forget_password_use_case.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;

  @factoryMethod
  ForgetPasswordCubit(this.forgetPasswordUseCase)
      : super(ForgetPasswordInitial());

  Future<void> sendResetEmail({required String email}) async {
    emit(ForgetPasswordLoading());

    final result = await forgetPasswordUseCase.call(email: email);

    switch (result) {
      case Success(data: final response):
        emit(ForgetPasswordSuccess(response));
      case Failure(exception: final message):
        emit(ForgetPasswordError(message));
    }
  }
}

