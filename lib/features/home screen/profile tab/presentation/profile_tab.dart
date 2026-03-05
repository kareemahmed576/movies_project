import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/Cubit/profile_cubit.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/Cubit/profile_state.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/widgets/history_list_screen.dart';
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
                  : HistoryListScreen(),
            ],
          ),
        );
      },
    );
  }
}
