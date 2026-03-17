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

  static const List<String> genreNames = [
    "Action", "Adventure", "Animation", "Comedy", "Crime", "Drama", "Family", "Fantasy", "Horror"
  ];

  static const Map<String, String> genres = {
    "Action": "28",
    "Adventure": "12",
    "Animation": "16",
    "Comedy": "35",
    "Crime": "80",
    "Drama": "18",
    "Family": "10751",
    "Fantasy": "14",
    "Horror": "27",
  };
  static const List<String> images = [
    AssetsManager.onboarding2,
    AssetsManager.onboarding2,
    AssetsManager.onboarding3,
    AssetsManager.onboarding4,
    AssetsManager.onboarding5,
    AssetsManager.onboarding6,
  ];
}
