import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_project/core/resources/result.dart';
import '../../domain/entities/forget_password_entity.dart';
import '../../domain/repositories/forget_password_repo.dart';
import '../data_sources/remote/forget_password_remote_data_source.dart';

@LazySingleton(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ForgetPasswordRemoteDataSource remoteDataSource;

  ForgetPasswordRepoImpl({required this.remoteDataSource});

  @override
  Future<Result<ForgetPasswordEntity>> sendResetPasswordEmail({
    required String email,
  }) async {
    try {
      final result = await remoteDataSource.sendResetPasswordEmail(email: email);
      return Success(result);
    } on FirebaseAuthException catch (e) {
      return Failure(e.message ?? 'Failed to send reset email');
    } catch (e) {
      return Failure('Try Again');
    }
  }
}
