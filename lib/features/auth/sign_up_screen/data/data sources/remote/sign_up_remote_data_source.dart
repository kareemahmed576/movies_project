
import '../../model/user_model.dart';

abstract interface class SignUpRemoteDataSource {
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String avatar,
  });
}
