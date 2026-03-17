import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../../../../home screen/home tab/data/model/movie available/movie_avaliable_model.dart';
import '../../../../../movie details/domain/entities/movie_details_entity.dart';
import '../../model/user_model.dart';

abstract interface class SignUpRemoteDataSource {
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String avatar,
  });

  Future<UserModel> signInWithGoogle();

  Future<void> addMovieToWatchList(MovieDetailsEntity movie);

  Future<void> removeMovieFromWatchList(int movieId);

  Future<QuerySnapshot> getWatchList();
}