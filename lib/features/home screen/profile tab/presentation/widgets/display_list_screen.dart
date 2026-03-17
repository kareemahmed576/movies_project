import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/reusable widget/movies_gridview.dart';
import '../../../../movie details/domain/entities/movie_details_entity.dart';

class DisplayListScreen extends StatelessWidget {
  final List<MovieDetailsEntity> movies;

  const DisplayListScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return Padding(
        padding: REdgeInsets.only(top: 170.0),
        child: Center(
          child: Image.asset(
            AssetsManager.empty,
            width: 125.w,
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    return MoviesGridview(
      movies: movies,
      itemCount: movies.length,
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      movieCardContainerWidth: 120,
      movieCardContainerHeight: 180,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}