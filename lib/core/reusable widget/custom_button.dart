import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_project/core/resources/color_manager.dart';


class CustomButton extends StatelessWidget {
  String title;
  Function() onClick;
  String? prefixIcon;
  Color color;
   CustomButton({required this.title,required this.onClick,this.prefixIcon,required this.color});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: REdgeInsets.only(right: 16,left: 16),
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: REdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Row(
          spacing: 11,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ?prefixIcon!=null?SvgPicture.asset(prefixIcon??""):null,
            Text(title.tr(),style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
      )
    );
  }
}
