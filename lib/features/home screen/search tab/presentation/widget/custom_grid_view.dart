import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/constants_manager.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entity.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/widget/custom_movie_card.dart';
import '../../../../../core/reusable widget/movie_card.dart';

class CustomGridView extends StatelessWidget {
  int itemCount;
  int crossAxisCount;
  int mainAxisSpacing;
  int crossAxisSpacing;
  int movieCardContainerWidth;
  int movieCardContainerHeight;
  ScrollPhysics? scrollPhysics;
  MovieAvailableEntity? movie;

  CustomGridView({
    required this.itemCount,
    required this.crossAxisCount,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
    required this.movieCardContainerWidth,
    required this.movieCardContainerHeight,
    this.scrollPhysics,
    required this.movie
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
        childAspectRatio: 0.8,
      ),
      physics: scrollPhysics,
      itemCount: itemCount,
      itemBuilder: (context, index) => CustomMovieCard(
        movie: movie!.movies![index],
        containerWidth: movieCardContainerWidth,
        containerHeight: movieCardContainerHeight,
      ),
    );
  }
}
