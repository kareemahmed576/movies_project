import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/core/reusable%20widget/custom_text_form_field.dart';
import 'package:movies_project/features/home%20screen/profile%20tab/presentation/widgets/history_list_screen.dart';

class SearchTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: Padding(
          padding:  REdgeInsets.symmetric(vertical: 21,horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(hintText: StringsManager.search.tr(), iconPath: AssetsManager.searchIcon),
                SizedBox(height: 0.7.sh,child: Center(child: Image.asset(AssetsManager.empty)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
