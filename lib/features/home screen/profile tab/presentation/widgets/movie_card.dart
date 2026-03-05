import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/color_manager.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/model/movieModel.dart';

class MovieCard extends StatelessWidget {
  MovieModel movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(image: AssetImage(movie.image)),
      ),
      width: 122.w,
      height: 180.h,
      child: Stack(
        children: [
          Padding(
            padding: REdgeInsets.only(left: 8, top: 12),
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
    );
  }
}
