import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/features/onboarding/data/model/onboarding_list.dart';
import 'package:movies_project/features/onboarding/presentation/widget/onboarding_item.dart';

import '../../../../core/resources/color_manager.dart';

class OnboardingScreen extends StatelessWidget {
  PageController controller=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => OnboardingItem(
                onboardingData: OnboardingList.onboarding[index],
              ),
              itemCount: OnboardingList.onboarding.length,
              controller: controller,
            ),
          ),
          Padding(
            padding: REdgeInsets.only(right: 16,left: 16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.gold,
                padding: REdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Center(child: Text(StringsManager.exploreNow.tr())),
            ),
          ),
          ?controller.initialPage==0?null:Padding(
            padding: REdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.gold,
                padding: REdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Center(child: Text(StringsManager.exploreNow.tr())),
            ),
          ),
          SizedBox(height: 20.h,)
        ],
      ),
    );
  }
}
