import 'package:firebase_auth/firebase_auth.dart';

abstract interface class SignUpRemoteDataSource {
  Future<UserCredential> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String avatar,
  });
}