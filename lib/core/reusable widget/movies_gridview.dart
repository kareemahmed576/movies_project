import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/constants_manager.dart';
import '../../../../../core/reusable widget/movie_card.dart';

class MoviesGridview extends StatelessWidget {
  int itemCount;
  int crossAxisCount;
  int mainAxisSpacing;
  int crossAxisSpacing;
  int movieCardContainerWidth;
  int movieCardContainerHeight;
  ScrollPhysics? scrollPhysics;
  MoviesGridview({
    required this.itemCount,
    required this.crossAxisCount,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
    required this.movieCardContainerWidth,
    required this.movieCardContainerHeight,
    this.scrollPhysics,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing.h,
        crossAxisSpacing: crossAxisSpacing.w,
        childAspectRatio: 0.8,
      ),
      physics: scrollPhysics,
      itemCount: itemCount,
      itemBuilder: (context, index) => MovieCard(
        movie: ConstantsManager.movies[index],
        containerWidth: movieCardContainerWidth,
        containerHeight: movieCardContainerHeight,
      ),
    );
  }
}
