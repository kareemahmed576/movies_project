import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/constants_manager.dart';
import 'package:movies_project/core/reusable%20widget/movies_gridview.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/Cubit/profile_cubit.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/Cubit/profile_state.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/widgets/profile_header.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/widgets/watch_list_screen.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              state is WatchListState
                  ? SizedBox(height: 0.5.sh, child: WatchListScreen())
                  : Padding(
                    padding: REdgeInsets.only(top: 24, left: 16, right: 16),
                    child: MoviesGridview(
                    itemCount: ConstantsManager.movies.length,
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    movieCardContainerWidth: 122,
                    movieCardContainerHeight: 180),
                  ),
            ],
          ),
        );
      },
    );
  }
}
