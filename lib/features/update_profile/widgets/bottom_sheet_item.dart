import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/color_manager.dart';

class BottomSheetItem extends StatelessWidget {
  bool isSelected;

  int index;

  BottomSheetItem({super.key, required this.isSelected, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108.w,
      height: 108.h,
      decoration: BoxDecoration(
        color: isSelected ? ColorManager.gold : ColorManager.lightBlack,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ColorManager.gold, width: 1),
      ),
      child: Padding(
        padding:  REdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            "assets/images/avatar$index.png",
            width: 86.w,
            height: 86.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
