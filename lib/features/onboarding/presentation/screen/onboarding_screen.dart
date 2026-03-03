import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/routes_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/features/onboarding/data/model/onboarding_list.dart';
import 'package:movies_project/features/onboarding/presentation/widget/custom_button_page_controller.dart';
import 'package:movies_project/features/onboarding/presentation/widget/onboarding_item.dart';

import '../../../../core/resources/color_manager.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics:NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => OnboardingItem(
                onboardingData: OnboardingList.onboarding[index],
                index: index,
              ),
              itemCount: OnboardingList.onboarding.length,
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  currentIndex=value ;
                });
              },
            ),
          ),
          CustomButtonPageController(
            title: currentIndex == 0
                ? StringsManager.exploreNow.tr()
                : currentIndex == 5
                ? StringsManager.finish.tr()
                : StringsManager.next.tr(),
            pages: () {
              if(currentIndex!=5){
                controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
              }
              else{
                Navigator.pushReplacementNamed(context, RoutesManager.loginsRoute);
              }
            },
          ),
          SizedBox(height: 16.h,),
          ?currentIndex == 0
              ? null
              : CustomButtonPageController(
                  title: StringsManager.back.tr(),
                  pages: () {
                    controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  },
                ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
