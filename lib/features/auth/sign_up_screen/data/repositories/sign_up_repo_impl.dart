import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/sign_up_repo.dart';
import '../data sources/remote/sign_up_remote_data_source.dart';

@LazySingleton(as: SignUpRepo)
class SignUpRepoImpl implements SignUpRepo {
  final SignUpRemoteDataSource remoteDataSource;

  SignUpRepoImpl({required this.remoteDataSource});

  @override
  Future<dynamic> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String avatar,
  }) async {
    try {
      final result = await remoteDataSource.signUp(
        email: email,
        password: password,
        name: name,
        phone: phone,
        avatar: avatar,
      );

      return result;
    } on FirebaseAuthException catch (e) {
      return (e.message ?? 'Failed to Sign Up');
    } catch (e) {
      return ('Try Again');
    }
  }
}
