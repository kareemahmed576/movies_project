
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/constants_manager.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/widgets/movie_card.dart';

class HistoryListScreen extends StatelessWidget {
  const HistoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: REdgeInsets.only(top: 24, left: 16 , right: 16),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3 ,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.w,
            childAspectRatio: 0.8
        ),
        itemCount: ConstantsManager.movies.length,
        itemBuilder: (context, index) => MovieCard(movie: ConstantsManager.movies[index]),
    );
  }
}
