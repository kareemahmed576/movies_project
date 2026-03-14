import '../../../../../core/resources/result.dart';
import '../entities/user_entity.dart';

abstract interface class SignUpRepo {
  Future<Result<UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String avatar,
  });
  Future<Result<UserEntity>> signInWithGoogle();
}
