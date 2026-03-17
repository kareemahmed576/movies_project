import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/DI/di.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/view%20model/section_states.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/view%20model/section_view_model.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/widget/custom_movie_card.dart';

import '../../../../../core/resources/constants_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../movie details/domain/entities/movie_details_entity.dart';

class SectionsPart extends StatelessWidget {
  final MovieDetailsEntity? movie;
  final String? title;
  final Function(int)? onSeeMoreClick;

  const SectionsPart({super.key, this.title, this.movie, this.onSeeMoreClick});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        String? genreId;
        if (title != null && ConstantsManager.genres.containsKey(title!)) {
          genreId = ConstantsManager.genres[title!];
        }
        return getIt.get<SectionViewModel>()..getCategories(genreId != null ? [genreId] : []);
      },
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title ?? ""),
                TextButton(
                  onPressed: () {
                    final genreNames = ConstantsManager.genres.keys.toList();
                    int genreIndex = genreNames.indexOf(title ?? "");
                    if (genreIndex == -1) genreIndex = 0;
                    onSeeMoreClick?.call(genreIndex);
                  },
                  child: Text(
                    StringsManager.seeMore.tr(),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<SectionViewModel, SectionStates>(
            builder: (BuildContext context, state) {
              if (state is SectionSuccessState) {
                var response = state.movieAvailableEntity.movies ?? [];
                return SizedBox(
                  height: 220.h,
                  child: ListView.separated(
                    padding: REdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) => CustomMovieCard(
                      movie: response[index],
                      containerWidth: 146,
                      containerHeight: 220,
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 16.w),
                    itemCount: response.length,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              } else if (state is SectionLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SectionErrorState) {
                return Center(child: Text(state.error));
              }
              return const SizedBox();
            },
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}