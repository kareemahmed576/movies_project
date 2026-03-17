import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/di/di.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/colors_manager.dart';
import 'package:movies_project/core/resources/dialog_utils.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/core/resources/validations.dart';
import 'package:movies_project/core/reusable widget/custom_button.dart';
import 'package:movies_project/core/reusable widget/custom_text_form_field.dart';
import 'package:movies_project/features/auth/forget_password_screen/presentation/Cubit/forget_password_cubit.dart';
import 'package:movies_project/features/auth/forget_password_screen/presentation/Cubit/forget_password_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late ForgetPasswordCubit forgetPasswordCubit;
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    forgetPasswordCubit = getIt<ForgetPasswordCubit>();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: forgetPasswordCubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: ColorManager.gold),
          ),
          title: Text(
            StringsManager.forgetPasswordAppBarTitle.tr(),
            style: Theme.of(
              context,
            ).textTheme.displaySmall!.copyWith(fontSize: 14),
          ),
        ),
        body: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordLoading) {
              DialogUtils.showLoadingDialog(context: context);
            } else if (state is ForgetPasswordSuccess) {
              DialogUtils.hideDialog(context);
              DialogUtils.showSuccessDialog(
                context: context,
                title: StringsManager.success.tr(),
                message: StringsManager.resetEmailSent.tr(),
              ).then((_) {
                if (mounted) {
                  Navigator.pop(context);
                }
              });
            } else if (state is ForgetPasswordError) {
              DialogUtils.hideDialog(context);
              DialogUtils.showErrorDialog(
                context: context,
                title: StringsManager.error.tr(),
                message: state.message,
              );
            }
          },
          child: Padding(
            padding: REdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(AssetsManager.forgotPassword),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: StringsManager.email.tr(),
                      iconPath: AssetsManager.emailIcon,
                      validator: (value) => Validations.validateEmail(value),
                    ),
                    SizedBox(height: 24.h),
                    CustomButton(
                      title: StringsManager.sendResetLink.tr(),
                      onClick: () {
                        if (formKey.currentState!.validate()) {
                          forgetPasswordCubit.sendResetEmail(
                            email: emailController.text.trim(),
                          );
                        }
                      },
                      color: ColorManager.gold,
                      textStyle: Theme.of(context).textTheme.titleMedium!,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}