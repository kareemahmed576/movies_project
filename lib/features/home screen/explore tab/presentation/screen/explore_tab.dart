import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/constants_manager.dart';
import 'package:movies_project/core/reusable%20widget/movies_gridview.dart';
import 'package:movies_project/features/home%20screen/explore%20tab/presentation/widgets/custom_tab.dart';

class ExploreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.all(16),
        child: DefaultTabController(
          length: ConstantsManager.genres.length,
          child: Column(
            children: [
              TabBar(
                dividerHeight: 0,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
                labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
                tabs: [
                  CustomTab(index: 0),
                  CustomTab(index: 1),
                  CustomTab(index: 2),
                  CustomTab(index: 3),
                ],
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: TabBarView(
                  children: [
                    MoviesGridview(
                      itemCount: ConstantsManager.movies.length,
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 16,
                      movieCardContainerWidth: 190,
                      movieCardContainerHeight: 280,
                    ),
                    MoviesGridview(
                      itemCount: ConstantsManager.movies.length,
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 16,
                      movieCardContainerWidth: 190,
                      movieCardContainerHeight: 280,
                    ),
                    MoviesGridview(
                      itemCount: ConstantsManager.movies.length,
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 16,
                      movieCardContainerWidth: 190,
                      movieCardContainerHeight: 280,
                    ),
                    MoviesGridview(
                      itemCount: ConstantsManager.movies.length,
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 16,
                      movieCardContainerWidth: 190,
                      movieCardContainerHeight: 280,
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
