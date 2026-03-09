import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/color_manager.dart';
import 'package:movies_project/core/resources/routes_manager.dart';
import 'package:movies_project/core/reusable%20widget/custom_button.dart';
import 'package:movies_project/core/reusable%20widget/language_switch.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/reusable widget/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ),
                  SizedBox(height: 22.h),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: StringsManager.password.tr(),
                    iconPath: AssetsManager.passwordIcon,
                    isPassword: true,
                  ),
                  SizedBox(height: 17.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          StringsManager.forgetPassword.tr(),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 33.h),
                  CustomButton(
                    title: StringsManager.login,
                    onClick: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesManager.homeRoute,
                      );
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
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: ColorManager.gold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 27.h),
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
                  SizedBox(height: 28.h),
                  CustomButton(
                    title: StringsManager.loginWithGoogle,
                    onClick: () {},
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
    );
  }
}
