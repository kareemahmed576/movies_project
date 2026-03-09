  import 'package:easy_localization/easy_localization.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';

  import '../../../../../core/resources/constants_manager.dart';
  import '../../../../../core/resources/strings_manager.dart';
  import '../../../../../core/reusable widget/movie_card.dart';

  class SectionsPart extends StatelessWidget {

    String title;
     SectionsPart({required this.title});

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    StringsManager.seeMore.tr(),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 220.h,
            child: ListView.separated(
              padding: REdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) => MovieCard(
                movie: ConstantsManager.movies[index],
                containerWidth: 146,
                containerHeight: 220,
              ),
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 12.h,),

        ],
      );
    }
  }
