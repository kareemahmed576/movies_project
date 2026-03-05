import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/color_manager.dart';

class CustomProfileBtn extends StatelessWidget {
  String text;
  bool? icon;
  final VoidCallback onclick;

  CustomProfileBtn({required this.text, required this.onclick, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 135.w,
        minHeight: 56.h
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: icon == null ? ColorManager.gold : ColorManager.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          )
        ),
        onPressed: onclick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: icon == null
                  ? Theme.of(context).textTheme.titleMedium
                  : Theme.of(context).textTheme.labelMedium,
            ),
            if (icon != null) ...[
              SizedBox(width: 4.w,),
              SvgPicture.asset(
                AssetsManager.logoutIcon,
                colorFilter: ColorFilter.mode(
                  ColorManager.white,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
