import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/DI/di.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/core/reusable%20widget/custom_text_form_field.dart';
import 'package:movies_project/core/reusable%20widget/movies_gridview.dart';
import 'package:movies_project/features/home%20screen/search%20tab/presentation/view_model/search_states.dart';
import 'package:movies_project/features/home%20screen/search%20tab/presentation/view_model/search_view_model.dart';
import 'package:movies_project/features/home%20screen/search%20tab/presentation/widget/custom_grid_view.dart';

import '../../../../core/resources/constants_manager.dart';
import '../../home tab/presentation/widget/custom_movie_card.dart';

class SearchTab extends StatefulWidget {
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late TextEditingController searchController;

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
    return BlocProvider(
      create: (context) =>
          getIt.get<SearchViewModel>(),
      child: Builder(
        builder: (context) {
          return Container(
            color: Theme.of(context).colorScheme.primary,
            child: SafeArea(
              child: Padding(
                padding: REdgeInsets.symmetric(vertical: 21, horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        onChange: (value) {
                          BlocProvider.of<SearchViewModel>(context).getSoruces(value);
                        },
                        hintText: StringsManager.search.tr(),
                        iconPath: AssetsManager.searchIcon,
                        controller: searchController,
                      ),
                      BlocBuilder<SearchViewModel, SearchStates>(
                        builder: (context, state) {
                          if (state is SearchLoadingState) {
                            return   SizedBox(
                              height: 0.7.sh,
                              child: Center(child: Image.asset(AssetsManager.empty)),
                            );
                          }  if (state is SearchSuccessState) {
                            var response = state.response.movies ?? [];
                            return GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16.h,
                                crossAxisSpacing: 16.w,
                                childAspectRatio: 0.8,
                              ),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: response.length,
                              itemBuilder: (context, index) => CustomMovieCard(
                                containerWidth: 191,
                                containerHeight: 279,
                                movie: response[index],
                              ),
                            );
                          }  if (state is SearchErrorState) {
                            return Center(child: Text("NO Data Found"));
                          } else {
                            return SizedBox(
                              height: 0.7.sh,
                              child: Center(child: Image.asset(AssetsManager.empty)),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
