import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/color_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/features/onboarding/data/model/onboarding_data.dart';

class OnboardingItem extends StatelessWidget {
  OnboardingData? onboardingData;
   OnboardingItem({this.onboardingData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(onboardingData?.imagePath??"",width: double.infinity,fit: BoxFit.cover,),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              ColorManager.darkBlack,
              ColorManager.darkBlack.withValues(alpha: 0.91),
              ColorManager.darkBlack.withValues(alpha: 0.50),
              ColorManager.darkBlack.withValues(alpha: 0),
            ],begin: Alignment.bottomCenter,
              end: Alignment.topCenter
            )
          ),
          child: Container(
            padding: REdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  onboardingData?.title??"".tr(),
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16.h,),
                Text(
                  onboardingData?.desc??"".tr(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white.withValues(alpha: 0.60)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
