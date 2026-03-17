import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/features/home%20screen/explore%20tab/presentation/screen/explore_tab.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/screen/home_tab.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/screen/profile_tab.dart';
import 'package:movies_project/features/home%20screen/search%20tab/presentation/search_tab.dart';

import '../../core/resources/colors_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int selectedGenreIndex = 0;

  void onSeeMoreClick(int genreIndex) {
    setState(() {
      selectedGenreIndex = genreIndex;
      selectedIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      HomeTab(onSeeMoreClick: onSeeMoreClick),
      SearchTab(),
      ExploreTab(initialIndex: selectedGenreIndex),
      ProfileTab()
    ];

    return Scaffold(
      extendBody: true,
      body: tabs[selectedIndex],
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(bottom: 9, right: 9, left: 9),
        child: SizedBox(
          height: 61.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: selectedIndex,
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: ColorManager.darkGray,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AssetsManager.homeUnSelected, width: 23.w, height: 23.h),
                    activeIcon: SvgPicture.asset(AssetsManager.homeSelected, width: 23.w, height: 23.h),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AssetsManager.searchUnSelected, width: 23.w, height: 23.h),
                    activeIcon: SvgPicture.asset(AssetsManager.searchSelected, width: 23.w, height: 23.h),
                    label: "search",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AssetsManager.exploreUnSelected, width: 23.w, height: 23.h),
                    activeIcon: SvgPicture.asset(AssetsManager.exploreSelected, width: 23.w, height: 23.h),
                    label: "explore",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AssetsManager.profileUnSelected, width: 23.w, height: 23.h),
                    activeIcon: SvgPicture.asset(AssetsManager.profileSelected, width: 23.w, height: 23.h),
                    label: "profile",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}