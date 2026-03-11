import '../../model/forget_password_model.dart';

abstract interface class ForgetPasswordRemoteDataSource {
  Future<ForgetPasswordModel> sendResetPasswordEmail({
    required String email,
  });
}

