import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/features/update_profile/manager/update_profile_states.dart';

class UpdateProfileViewModel extends Cubit<UpdateProfileStates> {
  UpdateProfileViewModel() : super(UpdateProfileInitial());

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> updateUserData({
    required String name,
    required String phone,
    required String avatar,
  }) async {
    emit(UpdateProfileLoading());
    try {
      final uId = _auth.currentUser?.uid;
      await _firestore.collection('users').doc(uId).update({
        'name': name,
        'phone': phone,
        'avatar': avatar,
      });
      emit(UpdateProfileSuccess());
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }

  Future<void> deleteUserAccount() async {
    emit(UpdateProfileLoading());
    try {
      final user = _auth.currentUser;
      final uId = user?.uid;

      await _firestore.collection('users').doc(uId).delete();

      await user?.delete();

      emit(UpdateProfileSuccess());
    } catch (e) {
      emit(UpdateProfileError("Please re-authenticate before deleting your account."));
    }
  }
}