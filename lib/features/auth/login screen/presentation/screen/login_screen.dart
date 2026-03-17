import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/DI/di.dart';
import 'package:movies_project/core/resources/colors_manager.dart';
import 'package:movies_project/core/resources/routes_manager.dart';
import 'package:movies_project/core/reusable%20widget/custom_button.dart';
import 'package:movies_project/core/reusable%20widget/language_switch.dart';
import 'package:movies_project/features/auth/sign_up_screen/presentation/manager/signup_state.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/dialog_utils.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/resources/validations.dart';
import '../../../../../core/reusable widget/custom_text_form_field.dart';
import '../../../sign_up_screen/presentation/manager/signup_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SignupCubit>(),
      child: Builder(
        builder: (innerContext) {
          return BlocListener<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupLoading) {
                DialogUtils.showLoadingDialog(context: context);
              } else if (state is SignupSuccess) {
                DialogUtils.hideDialog(context);
                Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
              } else if (state is SignupError) {
                DialogUtils.hideDialog(context);
                DialogUtils.showMessageDialog(context: context, message: state.message);
              }
            },
            child: Scaffold(
              body: Padding(
                padding: REdgeInsets.all(18.0),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Image.asset(
                            AssetsManager.moviesLogo,
                            height: 118.h,
                            fit: BoxFit.fitHeight,
                          ),
                          SizedBox(height: 69.h),
                          CustomTextFormField(
                            controller: emailController,
                            hintText: StringsManager.email.tr(),
                            iconPath: AssetsManager.emailIcon,
                            validator: Validations.validateEmail,
                          ),
                          SizedBox(height: 22.h),
                          CustomTextFormField(
                            controller: passwordController,
                            hintText: StringsManager.password.tr(),
                            iconPath: AssetsManager.passwordIcon,
                            isPassword: true,
                            validator: Validations.validatePassword,
                          ),
                          SizedBox(height: 17.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, RoutesManager.forgetPasswordRoute);
                                },
                                child: Text(
                                  StringsManager.forgetPassword.tr(),
                                  style: Theme.of(context).textTheme.displaySmall,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 33.h),
                          CustomButton(
                            title: StringsManager.login.tr(),
                            onClick: () async {
                              if (formKey.currentState?.validate() ?? false) {
                                try {
                                  DialogUtils.showLoadingDialog(context: context);
                                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                  );
                                  if (mounted) {
                                    DialogUtils.hideDialog(context);
                                    Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (mounted) {
                                    DialogUtils.hideDialog(context);
                                    String errorMessage = 'An error occurred';
                                    if (e.code == 'user-not-found') {
                                      errorMessage = 'No user found for that email.';
                                    } else if (e.code == 'wrong-password') {
                                      errorMessage = 'Wrong password provided.';
                                    } else if (e.code == 'invalid-credential') {
                                      errorMessage = 'Invalid email or password.';
                                    }
                                    DialogUtils.showMessageDialog(context: context, message: errorMessage);
                                  }
                                } catch (e) {
                                  if (mounted) {
                                    DialogUtils.hideDialog(context);
                                    DialogUtils.showMessageDialog(context: context, message: e.toString());
                                  }
                                }
                              }
                            },
                            color: Theme.of(context).colorScheme.tertiary,
                            textStyle: Theme.of(context).textTheme.titleMedium!,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                StringsManager.doNotHaveAccount.tr(),
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pushNamed(
                                  context,
                                  RoutesManager.signupRoute,
                                ),
                                child: Text(
                                  StringsManager.createOne.tr(),
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: ColorManager.gold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 27.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(child: Divider()),
                              Padding(
                                padding: REdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                child: Text(
                                  StringsManager.or.tr(),
                                  style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 15),
                                ),
                              ),
                              const Expanded(child: Divider()),
                            ],
                          ),
                          SizedBox(height: 28.h),
                          CustomButton(
                            title: StringsManager.loginWithGoogle.tr(),
                            onClick: () {
                              innerContext.read<SignupCubit>().signInWithGoogle();
                            },
                            color: Theme.of(context).colorScheme.tertiary,
                            prefixIcon: AssetsManager.googleLogo,
                            textStyle: Theme.of(context).textTheme.titleMedium!,
                          ),
                          SizedBox(height: 33.h),
                          LanguageSwitch(context.locale.languageCode),
                        ],
                      ),
                    ),
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