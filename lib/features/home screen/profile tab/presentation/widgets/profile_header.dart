import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/Cubit/profile_cubit.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/Cubit/profile_state.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/widgets/Custom_profile_btn.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/widgets/Custom_tab.dart';
import 'package:movies_project/features/update_profile/Cubit/selected_avatar_cubit.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/routes_manager.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double availableWidth = 1.sw - 48.w;
    double finalWidth = availableWidth / 2;

    return Container(
      color: ColorManager.darkGray,
      child: Padding(
        padding: REdgeInsets.only(top: 52, left: 24, right: 24),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BlocBuilder<SelectedAvatarCubit, String>(
                  builder: (context, state) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        state,
                        width: 118.w,
                        height: 118.h,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("10", style: Theme.of(context).textTheme.displayLarge),
                    SizedBox(height: 20.h),
                    Text(
                      "Wish List",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("12", style: Theme.of(context).textTheme.displayLarge),
                    SizedBox(height: 20.h),
                    Text(
                      "History",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: REdgeInsets.only(top: 16, bottom: 14),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "John Safwat",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomProfileBtn(
                    text: "Edit Profile",
                    onclick: () {
                      Navigator.pushNamed(
                        context,
                        RoutesManager.updateProfileRoute,
                      );
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                CustomProfileBtn(
                  text: "Exit",
                  onclick: () {
                    // handle Exit btn
                    // Mohamed Hamed will handle it
                  },
                  icon: true,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: CustomTab(
                          onTap: () {
                            context.read<ProfileCubit>().setWatchListState();
                          },
                          title: "Watch List",
                          image: AssetsManager.watchListIcon,
                        ),
                      ),
                      Expanded(
                        child: CustomTab(
                          onTap: () {
                            context.read<ProfileCubit>().setHistoryState();
                          },
                          title: "History",
                          image: AssetsManager.historyIcon,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Align(
                    alignment: state is WatchListState
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
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
            ),
          ],
        ),
      ),
    );
  }
}
