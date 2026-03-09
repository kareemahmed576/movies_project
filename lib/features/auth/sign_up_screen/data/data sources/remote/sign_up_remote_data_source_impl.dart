import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../model/user_model.dart';
import 'sign_up_remote_data_source.dart';

@LazySingleton(as: SignUpRemoteDataSource)
class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String avatar,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final userModel = UserModel(
      uId: userCredential.user!.uid,
      name: name,
      email: email,
      phone: phone,
      avatar: avatar,
    );

    await _firestore
        .collection('users')
        .doc(userModel.uId)
        .set(userModel.toJson());

    return userModel;
  }
}
