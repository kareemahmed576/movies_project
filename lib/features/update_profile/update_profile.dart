import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/routes_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/core/resources/dialog_utils.dart';
import 'package:movies_project/core/reusable%20widget/custom_button.dart';
import 'package:movies_project/core/reusable%20widget/custom_text_form_field.dart';
import 'package:movies_project/features/update_profile/widgets/app_bar.dart';
import 'package:movies_project/features/update_profile/widgets/bottom_sheet_container.dart';
import '../../core/resources/assets_manager.dart';
import '../../core/resources/colors_manager.dart';
import 'manager/selected_avatar_cubit.dart';
import 'manager/update_profile_states.dart' hide UpdateProfileViewModel;
import 'manager/update_profile_view_model.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    _fetchUserData();
  }

  void _fetchUserData() async {
    final uId = FirebaseAuth.instance.currentUser?.uid;
    final doc = await FirebaseFirestore.instance.collection('users').doc(uId).get();
    if (doc.exists) {
      final data = doc.data()!;
      nameController.text = data['name'] ?? "";
      phoneController.text = data['phone'] ?? "";
      if (mounted) {
        context.read<SelectedAvatarCubit>().selectAvatar(data['avatar'] ?? AssetsManager.avatar8);
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileViewModel(),
      child: BlocConsumer<UpdateProfileViewModel, UpdateProfileStates>(
        listener: (context, state) {
          if (state is UpdateProfileLoading) {
            DialogUtils.showLoadingDialog(context: context);
          } else if (state is UpdateProfileSuccess) {
            DialogUtils.hideDialog(context);
            DialogUtils.showSnackBar(context, "Profile Updated Successfully", ColorManager.green);
            if (FirebaseAuth.instance.currentUser == null) {
              Navigator.pushNamedAndRemoveUntil(context, RoutesManager.loginsRoute, (route) => false);
            } else {
              Navigator.pop(context);
            }
          } else if (state is UpdateProfileError) {
            DialogUtils.hideDialog(context);
            DialogUtils.showMessageDialog(context: context, message: state.message);
          }
        },
        builder: (context, updateState) {
          return BlocBuilder<SelectedAvatarCubit, String>(
            builder: (context, avatarState) => Scaffold(
              appBar: const UpdateAppBar(),
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 37.h),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (bottomContext) {
                              return BlocProvider.value(
                                value: context.read<SelectedAvatarCubit>(),
                                child: const BottomSheetContainer(),
                              );
                            },
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: avatarState.startsWith('http')
                              ? Image.network(
                            avatarState,
                            width: 150.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Image.asset(
                              AssetsManager.avatar8,
                              width: 150.w,
                              height: 150.h,
                              fit: BoxFit.cover,
                            ),
                          )
                              : Image.asset(
                            avatarState,
                            width: 150.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Image.asset(
                              AssetsManager.avatar8,
                              width: 150.w,
                              height: 150.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      CustomTextFormField(
                        controller: nameController,
                        hintText: "Name",
                        iconPath: AssetsManager.userLogo,
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        controller: phoneController,
                        hintText: "Phone Number",
                        iconPath: AssetsManager.phoneIcon,
                      ),
                      SizedBox(height: 20.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesManager.forgetPasswordRoute);
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            StringsManager.resetPassword.tr(),
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 100.h),
                      SizedBox(
                        width: double.infinity,
                        height: 56.h,
                        child: CustomButton(
                          title: StringsManager.deleteAccount.tr(),
                          onClick: () {
                            DialogUtils.showConfirmDeleteDialog(
                              context: context,
                              onDeletePressed: () {
                                Navigator.pop(context);
                                context.read<UpdateProfileViewModel>().deleteUserAccount();
                              },
                            );
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
                            context.read<UpdateProfileViewModel>().updateUserData(
                              name: nameController.text,
                              phone: phoneController.text,
                              avatar: avatarState,
                            );
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
        },
      ),
    );
  }
}