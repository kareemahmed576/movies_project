import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/movie details/domain/entities/movie_details_entity.dart';
import 'movie_card.dart';

class MoviesGridview extends StatelessWidget {
  final List<MovieDetailsEntity> movies;
  final int itemCount;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double movieCardContainerWidth;
  final double movieCardContainerHeight;
  final ScrollPhysics? scrollPhysics;

  const MoviesGridview({
    super.key,
    required this.movies,
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
        movie: movies[index],
        containerWidth: movieCardContainerWidth,
        containerHeight: movieCardContainerHeight,
      ),
    );
  }
}