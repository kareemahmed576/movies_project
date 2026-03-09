import 'package:injectable/injectable.dart';

import '../repositories/sign_up_repo.dart';

@injectable
class SignUpUseCase {
  final SignUpRepo repository;

  @factoryMethod
  SignUpUseCase(this.repository);

  Future<dynamic> call({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String avatar,
  }) {
    return repository.signUp(
      name: name,
      email: email,
      password: password,
      phone: phone,
      avatar: avatar,
    );
  }
}