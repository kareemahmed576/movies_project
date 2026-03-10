import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/colors_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/features/onboarding/data/model/onboarding_data.dart';

class OnboardingItem extends StatelessWidget {
  OnboardingData? onboardingData;
  int? index;
   OnboardingItem({this.onboardingData,this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(onboardingData?.imagePath??"",width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
        Container(
          decoration: BoxDecoration(
            gradient: index==0?LinearGradient(colors: [
              ColorsManager.darkBlack,
              ColorsManager.darkBlack.withValues(alpha: 0.91),
              ColorsManager.darkBlack.withValues(alpha: 0.50),
              ColorsManager.darkBlack.withValues(alpha: 0),
            ],begin: Alignment.bottomCenter,
              end: Alignment.topCenter
            ):null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(40.r),topLeft: Radius.circular(40.r)),
            child: Container(
              width: double.infinity,
              color: index==0?null:Theme.of(context).colorScheme.primary,
              padding: REdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
        ),
      ],
    );
  }
}
