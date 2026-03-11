import '../../../../../core/resources/result.dart';
import '../entities/forget_password_entity.dart';

abstract interface class ForgetPasswordRepo {
  Future<Result<ForgetPasswordEntity>> sendResetPasswordEmail({
    required String email,
  });
}

