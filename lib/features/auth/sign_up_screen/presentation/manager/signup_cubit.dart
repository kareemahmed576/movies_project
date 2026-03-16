import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/resources/result.dart';
import '../manager/signup_state.dart';
import '../../domain/use case/use_case.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignUpUseCase signUpUseCase;
  final GoogleSignInUseCase googleSignInUseCase;

  @factoryMethod
  SignupCubit(this.signUpUseCase, this.googleSignInUseCase) : super(SignupInitial());

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

    _handleResult(result);
  }

  Future<void> signInWithGoogle() async {
    emit(SignupLoading());

    final result = await googleSignInUseCase.call();

    _handleResult(result);
  }

  void _handleResult(Result result) {
    switch (result) {
      case Success(data: final user):
        emit(SignupSuccess(user));
      case Failure(exception: final message):
        emit(SignupError(message));
    }
  }
}