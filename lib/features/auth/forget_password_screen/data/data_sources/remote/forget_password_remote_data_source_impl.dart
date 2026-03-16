import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../model/forget_password_model.dart';
import 'forget_password_remote_data_source.dart';

@LazySingleton(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<ForgetPasswordModel> sendResetPasswordEmail({
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return ForgetPasswordModel(
        message: 'Password reset email sent successfully',
      );
    } on FirebaseAuthException {
      rethrow;
    }
  }
}

