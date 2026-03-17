import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/features/history_list/Cubit/history_list_cubit.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/Cubit/profile_cubit.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/Cubit/profile_state.dart' hide HistoryState; // تم إخفاء الاسم المتعارض هنا
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/widgets/profile_header.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/widgets/display_list_screen.dart';
import '../../../../history_list/Cubit/history_list_state.dart';
import '../../../../watch_list/Cubit/watch_list_cubit.dart';
import '../../../../watch_list/Cubit/watch_list_state.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  void initState() {
    super.initState();
    context.read<WatchListCubit>().loadWatchList();
    context.read<HistoryCubit>().loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileHeader(),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, profileState) {
              if (profileState is WatchListState) {
                return BlocBuilder<WatchListCubit, WatchState>(
                  builder: (context, state) {
                    if (state is WatchListLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is WatchListLoaded) {
                      return DisplayListScreen(movies: state.movies);
                    } else if (state is WatchListError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox();
                  },
                );
              } else {
                return BlocBuilder<HistoryCubit, HistoryState>(
                  builder: (context, state) {
                    if (state is HistoryLoading) {
                      return const Center(child: CircularProgressIndicator(color: Colors.white,));
                    } else if (state is HistoryLoaded) {
                      return DisplayListScreen(movies: state.movies);
                    } else if (state is HistoryError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox();
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}