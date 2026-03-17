import 'package:movies_project/core/resources/assets_manager.dart';

abstract class ConstantsManager {
  static const String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String phoneRegex = r'^01[0125][0-9]{8}$';
  static const String nameRegex = r'^[a-zA-Z\s\u0600-\u06FF]+$';


  static const List<String> avatars = [
    AssetsManager.avatar1,
    AssetsManager.avatar2,
    AssetsManager.avatar3,
    AssetsManager.avatar4,
    AssetsManager.avatar5,
    AssetsManager.avatar6,
    AssetsManager.avatar7,
    AssetsManager.avatar8,
    AssetsManager.avatar9,
  ];

  static const List<String> genres = [
    'Action',
    'Adventure',
    'Animation',
    'Biography',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'Film-Noir',
    'History',
    'Horror',
    'Music',
    'Musical',
    'Mystery',
    'Romance',
    'Sci-Fi',
    'Short',
    'Sport',
    'Thriller',
    'War',
    'Western',
  ];
  static const List<String> images = [
    AssetsManager.onboarding2,
    AssetsManager.onboarding2,
    AssetsManager.onboarding3,
    AssetsManager.onboarding4,
    AssetsManager.onboarding5,
    AssetsManager.onboarding6,
  ];
}
