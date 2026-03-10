import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/colors_manager.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/model/movieModel.dart';

import '../resources/routes_manager.dart';

class MovieCard extends StatelessWidget {
  MovieModel movie;
  int containerWidth;
  int containerHeight;

  MovieCard({
    required this.movie,
    required this.containerWidth,
    required this.containerHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
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
          image: DecorationImage(image: AssetImage(movie.image)),
        ),
        width: containerWidth.w,
        height: containerHeight.h,
        child: Stack(
          children: [
            Padding(
              padding: REdgeInsets.only(left: 8, top: 12),
              child: Container(
                width: 56.w,
                height: 27.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorsManager.darkBlack.withAlpha(150),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      movie.rate.toString(),
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(fontSize: 16),
                    ),
                    SvgPicture.asset(AssetsManager.rateIcon , width: 14, height: 14,)
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
