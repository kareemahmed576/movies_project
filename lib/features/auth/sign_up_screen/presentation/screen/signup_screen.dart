import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/di/di.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/dialog_utils.dart';
import 'package:movies_project/core/resources/routes_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/core/resources/validations.dart';
import 'package:movies_project/core/reusable%20widget/custom_button.dart';
import 'package:movies_project/core/reusable%20widget/custom_text_form_field.dart';
import 'package:movies_project/core/reusable%20widget/language_switch.dart';
import 'package:movies_project/features/auth/sign_up_screen/presentation/manager/signup_cubit.dart';
import 'package:movies_project/features/auth/sign_up_screen/presentation/manager/signup_state.dart';
import 'package:movies_project/features/auth/sign_up_screen/presentation/widgets/avatarList.dart';
import '../../../../../core/resources/colors_manager.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String selectedAvatar = "";

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupCubit>(),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: BlocConsumer<SignupCubit, SignupState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (state is SignupLoading) {
              DialogUtils.showLoadingDialog(context: context);
            } else if (state is SignupSuccess) {
              Navigator.of(context, rootNavigator: true).pop();
              DialogUtils.showToast(context: context, message: "Success", color: ColorManager.green);
              Navigator.pushReplacementNamed(context, RoutesManager.loginsRoute);
            } else if (state is SignupError) {
              Navigator.of(context, rootNavigator: true).pop();
              DialogUtils.showMessageDialog(context: context, message: state.message);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: REdgeInsets.all(18.0),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 180.h,
                          child: AvatarList(
                            onAvatarSelected: (avatar) => selectedAvatar = avatar,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: Text(StringsManager.avatar.tr(), style: Theme.of(context).textTheme.labelSmall),
                        ),
                        SizedBox(height: 12.h),
                        CustomTextFormField(
                          controller: nameController,
                          hintText: StringsManager.name.tr(),
                          iconPath: AssetsManager.nameIcon,
                          validator: Validations.validateName,
                        ),
                        SizedBox(height: 24.h),
                        CustomTextFormField(
                          controller: emailController,
                          hintText: StringsManager.email.tr(),
                          iconPath: AssetsManager.emailIcon,
                          validator: Validations.validateEmail,
                        ),
                        SizedBox(height: 24.h),
                        CustomTextFormField(
                          controller: passwordController,
                          hintText: StringsManager.password.tr(),
                          iconPath: AssetsManager.passwordIcon,
                          isPassword: true,
                          validator: Validations.validatePassword,
                        ),
                        SizedBox(height: 24.h),
                        CustomTextFormField(
                          controller: confirmPasswordController,
                          hintText: StringsManager.confirmPassword.tr(),
                          iconPath: AssetsManager.passwordIcon,
                          isPassword: true,
                          validator: (value) => Validations.validateConfirmPass(value, passwordController.text),
                        ),
                        SizedBox(height: 24.h),
                        CustomTextFormField(
                          controller: phoneController,
                          hintText: StringsManager.phoneNumber.tr(),
                          iconPath: AssetsManager.phoneIcon,
                          validator: Validations.validatePhone,
                        ),
                        SizedBox(height: 24.h),
                        CustomButton(
                          title: StringsManager.createAccount.tr(),
                          onClick: state is SignupLoading
                              ? () {}
                              : () {
                            if (formKey.currentState!.validate()) {
                              if (selectedAvatar.isEmpty) {
                                DialogUtils.showToast(context: context, message: "Please select an avatar", color: ColorManager.red);
                                return;
                              }
                              context.read<SignupCubit>().register(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                                avatar: selectedAvatar,
                              );
                            }
                          },
                          color: Theme.of(context).colorScheme.tertiary,
                          textStyle: Theme.of(context).textTheme.titleMedium!,
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(StringsManager.alreadyHaveAccount.tr(), style: Theme.of(context).textTheme.titleSmall),
                            SizedBox(width: 5.w),
                            TextButton(
                              onPressed: () => Navigator.pushNamed(context, RoutesManager.loginsRoute),
                              child: Text(StringsManager.login.tr(), style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.tertiary)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding: REdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                StringsManager.or.tr(),
                                style: Theme.of(
                                  context,
                                ).textTheme.displaySmall?.copyWith(fontSize: 15),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        CustomButton(
                          title: StringsManager.signWithGoogle.tr(),
                          onClick: () {},
                          color: Theme.of(context).colorScheme.tertiary,
                          prefixIcon: AssetsManager.googleLogo,
                          textStyle: Theme.of(context).textTheme.titleMedium!,
                        ),
                        SizedBox(height: 12.h),
                        LanguageSwitch(context.locale.languageCode),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}