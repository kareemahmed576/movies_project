import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/core/reusable%20widget/custom_text_form_field.dart';

class SearchTab extends StatefulWidget {

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
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
                CustomTextFormField(hintText: StringsManager.search.tr(), iconPath: AssetsManager.searchIcon,controller: searchController,),
                SizedBox(height: 0.7.sh,child: Center(child: Image.asset(AssetsManager.empty)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
