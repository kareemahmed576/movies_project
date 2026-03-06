import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/routes_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/core/reusable%20widget/custom_button.dart';
import 'package:movies_project/core/reusable%20widget/custom_text_form_field.dart';
import 'package:movies_project/core/reusable%20widget/language_switch.dart';
import 'package:movies_project/features/auth/sign_up_screen/presentation/widgets/avatarList.dart';

import '../../../../../core/resources/assets_manager.dart';

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

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Padding(
        padding: REdgeInsets.all(18.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 180.h, child: AvatarList()),
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    StringsManager.avatar.tr(),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                SizedBox(height: 12.h),
                CustomTextFormField(
                  hintText: StringsManager.name.tr(),
                  iconPath: AssetsManager.nameIcon,
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  hintText: StringsManager.email.tr(),
                  iconPath: AssetsManager.emailIcon,
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  hintText: StringsManager.password.tr(),
                  iconPath: AssetsManager.passwordIcon,
                  isPassword: true,
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  hintText: StringsManager.confirmPassword.tr(),
                  iconPath: AssetsManager.passwordIcon,
                  isPassword: true,
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  hintText: StringsManager.phoneNumber.tr(),
                  iconPath: AssetsManager.phoneIcon,
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  title: StringsManager.createAccount.tr(),
                  onClick: () {},
                  color: Theme.of(context).colorScheme.tertiary,
                  textStyle: Theme.of(context).textTheme.titleMedium!,
                ),
                SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringsManager.alreadyHaveAccount.tr(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(width: 5.w,),
                    TextButton(
                      onPressed: (){
                        
                      },
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(context, RoutesManager.loginsRoute),
                        child: Text(
                          StringsManager.login.tr(),
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                LanguageSwitch(
                  context.locale.languageCode
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
