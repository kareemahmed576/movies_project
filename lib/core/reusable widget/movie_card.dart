import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import '../../features/movie details/domain/entities/movie_details_entity.dart';
import '../resources/colors_manager.dart';
import '../resources/routes_manager.dart';

class MovieCard extends StatelessWidget {
  final MovieDetailsEntity movie;
  final double containerWidth;
  final double containerHeight;

  const MovieCard({
    super.key,
    required this.movie,
    required this.containerWidth,
    required this.containerHeight,
  });

  @override
  Widget build(BuildContext context) {
    print(movie.imagePath);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesManager.movieDetailsRoute,
        );
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          image: DecorationImage(
            image: movie.imagePath != null && movie.imagePath!.startsWith('http')
                ? NetworkImage(movie.imagePath!)
                : AssetImage(AssetsManager.onboarding4) as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
        width: containerWidth.w,
        height: containerHeight.h,
        child: Stack(
          children: [
            Padding(
              padding: REdgeInsets.all(8.0),
              child: Container(
                width: 56.w,
                height: 27.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorManager.darkBlack.withAlpha(150),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      movie.rating ?? "0.0",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 16),
                    ),
                    SvgPicture.asset(
                      AssetsManager.rateIcon,
                      width: 14.w,
                      height: 14.h,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}