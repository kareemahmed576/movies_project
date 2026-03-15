import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/routes_manager.dart';
import 'package:movies_project/features/movie%20details/domain/entities/movie_details_entity.dart';

class GenreGridview extends StatelessWidget {
  final List<MovieDetailsEntity> movies;
  final int itemCount;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  const GenreGridview({
    super.key,
    required this.movies,
    required this.itemCount,
    required this.crossAxisCount,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing.h,
        crossAxisSpacing: crossAxisSpacing.w,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              RoutesManager.movieDetailsRoute,
              arguments: movies[index],
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.network(
              movies[index].imagePath ?? "",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[900],
                child: const Icon(Icons.broken_image, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}