import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomContainer extends StatelessWidget {
  String icon;
  String value;
  CustomContainer({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: REdgeInsets.symmetric(vertical: 11, horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 10.w),
          Text(
            value,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ],
      ),
    );
  }
}
