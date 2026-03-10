import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/Cubit/profile_cubit.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/Cubit/profile_state.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/widgets/Custom_profile_btn.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/widgets/Custom_tab.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors_manager.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({super.key});

  double availableWidth = 1.sw - 48.w;
  late double finalWidth = availableWidth / 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.darkGray,
      child: Padding(
        padding: REdgeInsets.only(top: 52, left: 24, right: 24 ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    AssetsManager.avatar8,
                    width: 118.w,
                    height: 118.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Spacer(),
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
                Spacer(),
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
                        // handle Edit Profile
                        // create edit profile screen
                        // Mohamed Hamed will handle it
                      }),
                ),
                SizedBox(width: 10.w),
                CustomProfileBtn(
                    text: "Exit",
                    onclick: () {
                      // handle Exit btn
                      // Mohamed Hamed will handle it
                      }, icon: true),
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
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      height: 3,
                      width: finalWidth,
                      decoration: BoxDecoration(
                        color: ColorsManager.gold,
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
