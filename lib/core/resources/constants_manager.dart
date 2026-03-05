import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/model/movieModel.dart';

abstract class ConstantsManager {

  static List<MovieModel> movies = [
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
    MovieModel(rate: 7.7, image: AssetsManager.onboarding4),
  ];

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
    "Action",
    "Adventure",
    "Animation",
    "Biography",
  ];

}