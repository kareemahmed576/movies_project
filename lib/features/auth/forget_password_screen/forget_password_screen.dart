import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/core/reusable%20widget/custom_button.dart';
import 'package:movies_project/core/reusable%20widget/custom_text_form_field.dart';

import '../../../core/resources/colors_manager.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: REdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Form(
          child: Column(
            children: [
              Image.asset(AssetsManager.forgotPassword),
              CustomTextFormField(
                  hintText: StringsManager.email.tr(),
                  iconPath: AssetsManager.emailIcon
              ),
              SizedBox(height: 24.h,),
              CustomButton(
                  title: StringsManager.verifyEmail.tr(),
                  onClick: () {
                    // handle verify email
                  },
                  color: ColorManager.gold,
                  textStyle: Theme.of(context).textTheme.titleMedium!
              )
            ],
          ),
        ),
      ),
    );
  }
}
