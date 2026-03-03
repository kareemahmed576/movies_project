import 'package:easy_localization/easy_localization.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/features/onboarding/data/model/onboarding_data.dart';

class OnboardingList {
  static List<OnboardingData> onboarding=[
    OnboardingData(title: StringsManager.onboardingTitle1.tr(),desc: StringsManager.onboardingDescription1.tr(),imagePath: AssetsManager.onboarding1),
    OnboardingData(title: StringsManager.onboardingTitle2.tr(),desc: StringsManager.onboardingDescription2.tr(),imagePath: AssetsManager.onboarding2),
    OnboardingData(title: StringsManager.onboardingTitle3.tr(),desc: StringsManager.onboardingDescription3.tr(),imagePath: AssetsManager.onboarding3),
    OnboardingData(title: StringsManager.onboardingTitle4.tr(),desc: StringsManager.onboardingDescription4.tr(),imagePath: AssetsManager.onboarding4),
    OnboardingData(title: StringsManager.onboardingTitle5.tr(),desc: StringsManager.onboardingDescription5.tr(),imagePath: AssetsManager.onboarding5),
    OnboardingData(title: StringsManager.onboardingTitle6.tr(),desc: null,imagePath: AssetsManager.onboarding6),
  ];
}