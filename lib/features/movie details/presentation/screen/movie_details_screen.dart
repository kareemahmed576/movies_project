import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/colors_manager.dart';
import 'package:movies_project/core/resources/dialog_utils.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/core/reusable%20widget/custom_button.dart';
import 'package:movies_project/features/history_list/Cubit/history_list_cubit.dart';
import 'package:movies_project/features/history_list/Cubit/history_list_state.dart';
import 'package:movies_project/features/movie%20details/presentation/manager/movie_details_view_model.dart';
import 'package:movies_project/features/movie%20details/presentation/manager/movie_details_states.dart';
import 'package:movies_project/features/movie%20details/presentation/widgets/custom_container.dart';
import 'package:movies_project/features/movie%20details/presentation/widgets/genre_gridview.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../watch_list/Cubit/watch_list_cubit.dart';
import '../../../watch_list/Cubit/watch_list_state.dart';
import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieDetailsEntity movie;

  const MovieDetailsScreen(this.movie, {super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final watchListState = context.watch<WatchListCubit>().state;
    bool inWatchList = false;
    if (watchListState is WatchListLoaded) {
      inWatchList = watchListState.movies.any((m) => m.id == widget.movie.id);
    }

    final historyState = context.watch<HistoryCubit>().state;
    bool inHistory = false;
    if (historyState is HistoryLoaded) {
      inHistory = historyState.movies.any((m) => m.id == widget.movie.id);
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(AssetsManager.backArrowIcon),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final historyCubit = context.read<HistoryCubit>();
              if (inHistory) {
                historyCubit.removeMovie(widget.movie.id ?? 0);
                DialogUtils.showSnackBar(context, "Removed from History", ColorManager.red);
              } else {
                historyCubit.addMovie(widget.movie);
                DialogUtils.showSnackBar(context, "Added to History", ColorManager.green);
              }
            },
            icon: SvgPicture.asset(
              AssetsManager.saveIcon,
              colorFilter: ColorFilter.mode(
                inHistory ? ColorManager.gold : ColorManager.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 600.h,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    image: DecorationImage(
                      image: widget.movie.imagePath != null && widget.movie.imagePath!.startsWith('http')
                          ? NetworkImage(widget.movie.imagePath!)
                          : AssetImage(AssetsManager.onboarding4) as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary.withAlpha(50),
                        Theme.of(context).colorScheme.primary,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => _launchTrailer(widget.movie.trailerUrl),
                    child: Image.asset(AssetsManager.playIcon),
                  ),
                ),
                Positioned(
                  bottom: 8.h,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding: REdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.movie.title.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: REdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                            widget.movie.year.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayMedium
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomButton(
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: inWatchList ? ColorManager.darkBlack : ColorManager.white,
                  ),
                  color: inWatchList ? ColorManager.green : ColorManager.red,
                  title: inWatchList ? "In Watchlist" : StringsManager.watch.tr(),
                  onClick: () {
                    final watchCubit = context.read<WatchListCubit>();
                    if (inWatchList) {
                      watchCubit.removeMovie(widget.movie.id ?? 0);
                      DialogUtils.showSnackBar(context, "Removed from WatchList", ColorManager.red);
                    } else {
                      watchCubit.addMovie(widget.movie);
                      DialogUtils.showSnackBar(context, "Added to WatchList", ColorManager.green);
                    }
                  },
                  prefixIcon: null,
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomContainer(
                        icon: AssetsManager.watchIcon,
                        value: "0",
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomContainer(
                        icon: AssetsManager.rateIcon,
                        value: widget.movie.rating?.toString() ?? "0.0",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  StringsManager.summary.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 8.h),
                Text(
                  widget.movie.summary.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 16.h),
                Text(
                  StringsManager.similar.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 16.h),
                BlocBuilder<MovieDetailsViewModel, MovieDetailsStates>(
                  builder: (context, state) {
                    if (state is SimilarMoviesLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SimilarMoviesErrorState) {
                      return Center(child: Text(state.message));
                    } else if (state is SimilarMoviesSuccessState) {
                      return GenreGridview(
                        movies: state.similarMovies,
                        itemCount: state.similarMovies.length,
                        crossAxisCount: 3,
                        mainAxisSpacing: 11,
                        crossAxisSpacing: 16,
                      );
                    }
                    return const SizedBox();
                  },
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchTrailer(String? url) async {
    if (url == null || url.isEmpty) {
      DialogUtils.showSnackBar(context, "Trailer not available", ColorManager.red);
      return;
    }
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      DialogUtils.showSnackBar(context, "Could not launch trailer", ColorManager.red);
    }
  }
}