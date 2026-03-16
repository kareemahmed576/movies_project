import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/reusable widget/movies_gridview.dart';
import '../manager/explore_cubit.dart';
import '../manager/explore_states.dart';

class ExploreMoviesGrid extends StatefulWidget {
  final String genre;
  const ExploreMoviesGrid({required this.genre});

  @override
  State<ExploreMoviesGrid> createState() => _ExploreMoviesGridState();
}

class _ExploreMoviesGridState extends State<ExploreMoviesGrid> {
  @override
  void initState() {
    super.initState();
    context.read<ExploreCubit>().getMovies(widget.genre);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreStates>(
      builder: (context, state) {
        if (state is ExploreLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExploreSuccessState) {
          return MoviesGridview(
            movies: state.movies,
            itemCount: state.movies.length,
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 16,
            movieCardContainerWidth: 190,
            movieCardContainerHeight: 280,
          );
        } else if (state is ExploreErrorState) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}