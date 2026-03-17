import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/movie details/domain/entities/movie_details_entity.dart';
import 'movie_card.dart';

class MoviesGridview extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double movieCardContainerWidth;
  final double movieCardContainerHeight;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final List<MovieDetailsEntity>? movies;
  final ScrollController? controller;

  const MoviesGridview({
    super.key,
    required this.itemCount,
    required this.crossAxisCount,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
    required this.movieCardContainerWidth,
    required this.movieCardContainerHeight,
    this.physics,
    this.shrinkWrap = false,
    this.movies,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      shrinkWrap: shrinkWrap,
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing.h,
        crossAxisSpacing: crossAxisSpacing.w,
        childAspectRatio: (movieCardContainerWidth / movieCardContainerHeight),
      ),
      physics: physics,
      itemCount: itemCount,
      itemBuilder: (context, index) => MovieCard(
        movie: movies![index],
        containerWidth: movieCardContainerWidth,
        containerHeight: movieCardContainerHeight,
      ),
    );
  }
}