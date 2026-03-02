import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/features/home%20screen/explore%20tab/presentation/explore_tab.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/home_tab.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/profile_tab.dart';
import 'package:movies_project/features/home%20screen/search%20tab/presentation/search_tab.dart';

import '../../core/resources/color_manager.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [HomeTab(), SearchTab(), ExploreTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
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
              physics: NeverScrollableScrollPhysics(),
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
                    icon: SvgPicture.asset(AssetsManager.homeUnSelected,width: 23,height: 23,),
                    activeIcon: SvgPicture.asset(AssetsManager.homeSelected,width: 23,height: 23,),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AssetsManager.searchUnSelected,width: 23,height: 23,),
                    activeIcon: SvgPicture.asset(AssetsManager.searchSelected,width: 23,height: 23,),
                    label: "search",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AssetsManager.exploreUnSelected,width: 23,height: 23,),
                    activeIcon: SvgPicture.asset(AssetsManager.exploreSelected,width: 23,height: 23,),
                    label: "explore",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(AssetsManager.profileUnSelected,width: 23,height: 23,),
                    activeIcon: SvgPicture.asset(AssetsManager.profileSelected,width: 23,height: 23,),
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
