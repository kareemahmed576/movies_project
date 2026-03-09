abstract class SignUpRepo {
  Future<dynamic> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String avatar,
  });
}