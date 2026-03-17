import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart' as google_auth;
import 'package:injectable/injectable.dart';
import '../../../../../home screen/home tab/data/model/movie available/movie_avaliable_model.dart';
import '../../../../../movie details/domain/entities/movie_details_entity.dart';
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

  @override
  Future<UserModel> signInWithGoogle() async {
    final google_auth.GoogleSignIn googleSignIn = google_auth.GoogleSignIn(
      serverClientId: "126978282132-f52cl6s5jtntuho1ulp9pj3dctnmvdci.apps.googleusercontent.com",
    );

    final google_auth.GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      throw Exception("Sign in canceled");
    }

    final google_auth.GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    final userCredential = await _auth.signInWithCredential(credential);
    final user = userCredential.user!;

    final userModel = UserModel(
      uId: user.uid,
      name: user.displayName ?? "No Name",
      email: user.email ?? "",
      phone: user.phoneNumber ?? "",
      avatar: user.photoURL ?? "",
    );

    await _firestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toJson(), SetOptions(merge: true));

    return userModel;
  }

  Future<void> addMovieToWatchList(MovieDetailsEntity movie) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }

    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('watchlist')
        .doc(movie.id.toString())
        .set({
      "movieId": movie.id,
      "title": movie.title,
      "image": movie.imagePath,
      "rating": movie.rating,
      "year": movie.year,
      "runtime": movie.runtime,
      "genres": movie.genres,
      "summary": movie.summary,
      "trailerUrl": movie.trailerUrl,
      "addedAt": FieldValue.serverTimestamp(),
    });
  }

  Future<QuerySnapshot> getWatchList() async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }

    return await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('watchlist')
        .get();
  }

  Future<void> removeMovieFromWatchList(int movieId) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }

    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('watchlist')
        .doc(movieId.toString())
        .delete();
  }
}
