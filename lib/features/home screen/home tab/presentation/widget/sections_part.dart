import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/DI/di.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entitiy_req.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/view%20model/section_states.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/view%20model/section_view_model.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/widget/custom_movie_card.dart';

import '../../../../../core/resources/constants_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/reusable widget/movie_card.dart';
import '../../../../movie details/domain/entities/movie_details_entity.dart';
import '../view model/movie_states.dart';

class SectionsPart extends StatelessWidget {
  MovieDetailsEntity? movie;
  String? title;
  SectionsPart({this.title,this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>getIt.get<SectionViewModel>()..getCategories(movie?.genres??[]),
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title??""),
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
          BlocBuilder<SectionViewModel, SectionStates>(
            builder: (BuildContext context, state) {
              switch (state) {
                case SectionSuccessState():
                  var response= state.movieAvailableEntity.movies??[];
                  return SizedBox(
                    height: 220.h,
                    child: ListView.separated(

                      padding: REdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) => CustomMovieCard(
                        movie: response[index],
                        containerWidth: 146,
                        containerHeight: 220,
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 16.w),
                      itemCount: response.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                case SectionLoadingState():
                  return Center(child: CircularProgressIndicator(),);
                case SectionErrorState():
                  return Center(child: Text(state.error),);
              }
            },
          ),
          SizedBox(height: 12.h,),

        ],
      ),
    );
  }
}
