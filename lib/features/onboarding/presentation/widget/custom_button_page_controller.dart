import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/color_manager.dart';


class CustomButtonPageController extends StatelessWidget {
  String title;
  Function() pages;
   CustomButtonPageController({required this.title,required this.pages});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: REdgeInsets.only(right: 16,left: 16),
      child: ElevatedButton(
        onPressed: pages,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          padding: REdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Center(child: Text(title.tr(),style: Theme.of(context).textTheme.titleMedium,),
      ),
      )
    );
  }
}
