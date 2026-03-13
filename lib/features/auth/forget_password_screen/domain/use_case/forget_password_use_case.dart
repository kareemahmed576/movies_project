import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/result.dart';
import '../entities/forget_password_entity.dart';
import '../repositories/forget_password_repo.dart';

@injectable
class ForgetPasswordUseCase {
  final ForgetPasswordRepo repository;

  @factoryMethod
  ForgetPasswordUseCase(this.repository);

  Future<Result<ForgetPasswordEntity>> call({required String email}) {
    return repository.sendResetPasswordEmail(email: email);
  }
}

