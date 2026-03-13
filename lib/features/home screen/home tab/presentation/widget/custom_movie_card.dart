import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/colors_manager.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entitiy_req.dart';

import '../../../../../core/resources/routes_manager.dart';

class CustomMovieCard extends StatelessWidget {
  MovieAvailableEntitiyReq movie;
  int containerWidth;
  int containerHeight;

  CustomMovieCard({
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
        width: containerWidth.w,
        height: containerHeight.h,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: movie.imagePath ?? "",
                width: containerWidth.w,
                height: containerHeight.h,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error),
              ),
            ),

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
                      movie.rating.toString(),
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