import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/reusable widget/movies_gridview.dart';
import '../../../../watch_list/Cubit/watch_list_cubit.dart';
import '../../../../watch_list/Cubit/watch_list_state.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {

  @override
  void initState() {
    super.initState();
    context.read<WatchListCubit>().loadWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListCubit, WatchState>(
      builder: (context, state) {

        if (state is WatchListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        else if (state is WatchListLoaded) {

          final movies = state.movies;

          if (movies.isEmpty) {
            return SizedBox(
              height: 0.5.sh,
              child: Image.asset(AssetsManager.empty),
            );
          }

          return MoviesGridview(
            movies: movies,
            itemCount: movies.length,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            movieCardContainerWidth: 122,
            movieCardContainerHeight: 180,
          );
        }

        else if (state is WatchListError) {
          return Center(
            child: Text(state.message),
          );
        }

        return SizedBox(
          height: 0.5.sh,
          child: Image.asset(AssetsManager.empty),
        );
      },
    );
  }
}