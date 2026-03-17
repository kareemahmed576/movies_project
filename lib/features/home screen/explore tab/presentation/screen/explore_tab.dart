import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/constants_manager.dart';
import 'package:movies_project/core/di/di.dart';
import '../manager/explore_cubit.dart';
import '../widgets/custom_tab.dart';
import '../widgets/explore_movies_grid.dart';

class ExploreTab extends StatelessWidget {
  final int initialIndex;

  const ExploreTab({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.all(16),
        child: DefaultTabController(
          key: ValueKey(initialIndex),
          length: ConstantsManager.genres.length,
          initialIndex: initialIndex,
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
                tabs: ConstantsManager.genres.asMap().entries.map((entry) {
                  return CustomTab(index: entry.key);
                }).toList(),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: TabBarView(
                  children: ConstantsManager.genres.map((genre) {
                    return BlocProvider(
                      create: (context) => getIt<ExploreCubit>(),
                      child: ExploreMoviesGrid(genre: genre),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}