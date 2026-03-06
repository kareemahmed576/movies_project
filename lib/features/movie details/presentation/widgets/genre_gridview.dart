import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/constants_manager.dart';
import 'package:movies_project/features/movie%20details/presentation/widgets/genre_view.dart';

class GenreGridview extends StatelessWidget {
  int itemCount;
  int crossAxisCount;
  int mainAxisSpacing;
  int crossAxisSpacing;
  ScrollPhysics? scrollPhysics;

  GenreGridview({
    required this.itemCount,
    required this.crossAxisCount,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
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
        childAspectRatio: 2.5,
      ),
      physics: scrollPhysics,
      itemCount: itemCount,
      itemBuilder: (context, index) =>
          GenreView(title: ConstantsManager.genres[index]),
    );
  }
}
