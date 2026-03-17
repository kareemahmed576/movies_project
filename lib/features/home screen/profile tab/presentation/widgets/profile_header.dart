import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/features/history_list/Cubit/history_list_cubit.dart';
import 'package:movies_project/features/history_list/Cubit/history_list_state.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/Cubit/profile_cubit.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/Cubit/profile_state.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/widgets/Custom_profile_btn.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/widgets/Custom_tab.dart';
import 'package:movies_project/features/watch_list/Cubit/watch_list_cubit.dart';
import 'package:movies_project/features/watch_list/Cubit/watch_list_state.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/routes_manager.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({super.key});

  final double availableWidth = 1.sw - 48.w;
  late final double finalWidth = availableWidth / 2;

  @override
  Widget build(BuildContext context) {
    final uId = FirebaseAuth.instance.currentUser?.uid;

    final watchListState = context.watch<WatchListCubit>().state;
    int watchListCount = 0;
    if (watchListState is WatchListLoaded) {
      watchListCount = watchListState.movies.length;
    }

    final historyState = context.watch<HistoryCubit>().state;
    int historyCount = 0;
    if (historyState is HistoryLoaded) {
      historyCount = historyState.movies.length;
    }

    return Container(
      color: ColorManager.darkGray,
      child: Padding(
        padding: REdgeInsets.only(top: 52, left: 24, right: 24),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('users').doc(uId).snapshots(),
          builder: (context, snapshot) {
            String userName = "Loading...";
            String userAvatar = AssetsManager.avatar8;

            if (snapshot.hasData && snapshot.data!.exists) {
              final data = snapshot.data!.data() as Map<String, dynamic>;
              userName = data['name'] ?? "No Name";
              userAvatar = data['avatar'] ?? AssetsManager.avatar8;
            }

            return BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: (userAvatar.startsWith('http'))
                              ? Image.network(
                            userAvatar,
                            width: 118.w,
                            height: 118.h,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Image.asset(AssetsManager.avatar8),
                          )
                              : Image.asset(
                            userAvatar,
                            width: 118.w,
                            height: 118.h,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Image.asset(AssetsManager.avatar8),
                          ),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text("$watchListCount", style: Theme.of(context).textTheme.displayLarge),
                            SizedBox(height: 8.h),
                            Text(StringsManager.watchList.tr(), style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text("$historyCount", style: Theme.of(context).textTheme.displayLarge),
                            SizedBox(height: 8.h),
                            Text(StringsManager.history.tr(), style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: REdgeInsets.only(top: 16, bottom: 20,left: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          userName,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomProfileBtn(
                              text: StringsManager.editProfile.tr(),
                              onclick: () {
                                Navigator.pushNamed(context, RoutesManager.updateProfileRoute);
                              }),
                        ),
                        SizedBox(width: 10.w),
                        CustomProfileBtn(
                            text: StringsManager.exit.tr(),
                            icon: true,
                            onclick: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  RoutesManager.loginsRoute,
                                      (route) => false
                              );
                            }),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: CustomTab(
                                onTap: () => context.read<ProfileCubit>().setWatchListState(),
                                title: StringsManager.watchList.tr(),
                                image: AssetsManager.watchListIcon,
                              ),
                            ),
                            Expanded(
                              child: CustomTab(
                                onTap: () => context.read<ProfileCubit>().setHistoryState(),
                                title: StringsManager.history.tr(),
                                image: AssetsManager.historyIcon,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 18.h),
                        Align(
                          alignment: state is WatchListState ? Alignment.centerLeft : Alignment.centerRight,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            height: 3,
                            width: finalWidth,
                            decoration: BoxDecoration(
                              color: ColorManager.gold,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}