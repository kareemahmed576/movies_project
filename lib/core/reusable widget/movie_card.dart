import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/colors_manager.dart';
import 'package:movies_project/core/resources/routes_manager.dart';
import 'package:movies_project/features/movie%20details/domain/entities/movie_details_entity.dart';

class MovieCard extends StatelessWidget {
  final MovieDetailsEntity? movie;
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesManager.movieDetailsRoute,
          arguments: movie,
        );
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          image: DecorationImage(
            image: movie?.imagePath != null &&
                movie!.imagePath!.startsWith('http')
                ? NetworkImage(movie!.imagePath!)
                : const AssetImage(AssetsManager.onboarding4) as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
        width: containerWidth.w,
        height: containerHeight.h,
        child: Stack(
          children: [
            Padding(
              padding: REdgeInsets.only(left: 8, top: 12),
              child: Container(
                padding: REdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorManager.darkBlack.withAlpha(150),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movie?.rating ?? "0.0",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(width: 4.w),
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