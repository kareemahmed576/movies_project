import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/color_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/core/reusable%20widget/custom_button.dart';
import 'package:movies_project/core/reusable%20widget/custom_text_form_field.dart';
import 'package:movies_project/features/update_profile/widgets/app_bar.dart';
import 'package:movies_project/features/update_profile/widgets/bottom_sheet_container.dart';

import '../../core/resources/assets_manager.dart';
import 'Cubit/selected_avatar_cubit.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedAvatarCubit, String>(
      builder: (context, state) => Scaffold(
        appBar: const UpdateAppBar(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 37.h),
                InkWell(
                  onTap: () {
                    // handle pick avatar from bottom sheet
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (bottomContext) {
                        return BlocProvider.value(
                          value: context.read<SelectedAvatarCubit>(),
                          child: BottomSheetContainer(),
                        );
                      },
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      state,
                      width: 150.w,
                      height: 150.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                CustomTextFormField(
                  hintText: "John Safwat",
                  iconPath: AssetsManager.userLogo,
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  hintText: "01289379303",
                  iconPath: AssetsManager.phoneIcon,
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    StringsManager.resetPassword.tr(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: CustomButton(
                    title: StringsManager.deleteAccount.tr(),
                    onClick: () {
                      // handle delete account
                    },
                    color: ColorManager.red,
                    textStyle: Theme.of(context).textTheme.labelMedium!,
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: CustomButton(
                    title: StringsManager.updateData.tr(),
                    onClick: () {
                      //handle update data
                    },
                    color: ColorManager.gold,
                    textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
