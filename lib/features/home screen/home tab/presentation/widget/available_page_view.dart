import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/DI/di.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/reusable%20widget/movie_card.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/view%20model/movie_states.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/view%20model/movie_view_model.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/widget/custom_movie_card.dart';

import '../../../../../core/resources/colors_manager.dart';

class AvailablePageView extends StatefulWidget {
  @override
  State<AvailablePageView> createState() => _AvailablePageViewState();
}

class _AvailablePageViewState extends State<AvailablePageView> {
  int selectedIndex = 0;

  PageController controller = PageController(viewportFraction: 0.7);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt.get<MovieViewModel>()..getMovies(),
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 655.h,
          child: Stack(
            children: [
              Image.asset(
                AssetsManager.onboarding6,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorManager.darkBlack,
                      ColorManager.darkBlack.withValues(alpha: 0.80),
                      ColorManager.darkBlack.withValues(alpha: 0.60),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AssetsManager.availableNow),
                    BlocBuilder<MovieViewModel, MovieStates>(
                      builder: (context, state) {
                        switch (state) {
                          case MovieSuccessState():
                            var response=state.movieAvailableEntity.movies??[];
                            return SizedBox(
                              height: 380.h,
                              child: PageView.builder(
                                itemBuilder: (context, index) => Padding(
                                  padding: REdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: selectedIndex == index ? 0 : 35.h,
                                  ),
                                  child: CustomMovieCard(
                                    movie: response[index],
                                    containerWidth: 234,
                                    containerHeight: 351,
                                  ),
                                ),
                                itemCount: response.length,
                                controller: controller,
                                onPageChanged: (value) {
                                  setState(() {
                                    selectedIndex = value;
                                  });
                                },
                              ),
                            );
                          case MovieLoadingState():
                           return Center(child: CircularProgressIndicator(),);
                          case MovieErrorState():
                            return Center(child: Text(state.error),);
                        }
                      },
                    ),
                    SizedBox(height: 21.h),
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 38),
                      child: Image.asset(AssetsManager.watchNow),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
