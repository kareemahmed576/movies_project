import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/constants_manager.dart';
import 'movie_card.dart';

class MoviesGridview extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double movieCardContainerWidth;
  final double movieCardContainerHeight;
  final ScrollPhysics? scrollPhysics;

  const MoviesGridview({
    super.key,
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
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing.h,
        crossAxisSpacing: crossAxisSpacing.w,
        childAspectRatio: (movieCardContainerWidth / movieCardContainerHeight),
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
