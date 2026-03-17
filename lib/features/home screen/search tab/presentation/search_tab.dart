import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/DI/di.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/core/reusable%20widget/custom_text_form_field.dart';
import 'package:movies_project/features/home%20screen/search%20tab/presentation/view_model/search_states.dart';
import 'package:movies_project/features/home%20screen/search%20tab/presentation/view_model/search_view_model.dart';

import '../../home tab/presentation/widget/custom_movie_card.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late TextEditingController searchController;
  final SearchViewModel viewModel = getIt.get<SearchViewModel>();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: Padding(
            padding: REdgeInsets.symmetric(vertical: 21, horizontal: 16),
            child: Column(
              children: [
                CustomTextFormField(
                  onChange: (value) {
                    viewModel.getSources(value);
                  },
                  hintText: StringsManager.search.tr(),
                  iconPath: AssetsManager.searchIcon,
                  controller: searchController,
                ),
                Expanded(
                  child: BlocBuilder<SearchViewModel, SearchStates>(
                    builder: (context, state) {
                      if (state is SearchInitialState) {
                        return Center(child: Image.asset(AssetsManager.empty));
                      }

                      if (state is SearchLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is SearchSuccessState) {
                        var movies = state.response.movies ?? [];

                        if (movies.isEmpty) {
                          return const Center(
                              child: Text("No Movies Found",
                                  style: TextStyle(color: Colors.white)));
                        }

                        return GridView.builder(
                          padding: EdgeInsets.only(top: 20.h),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16.h,
                            crossAxisSpacing: 16.w,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: movies.length,
                          itemBuilder: (context, index) => CustomMovieCard(
                            containerWidth: 191,
                            containerHeight: 279,
                            movie: movies[index],
                          ),
                        );
                      }

                      if (state is SearchErrorState) {
                        return Center(
                            child: Text(state.error,
                                style: const TextStyle(color: Colors.red)));
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}