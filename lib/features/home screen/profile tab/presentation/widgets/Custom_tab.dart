import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_project/core/resources/color_manager.dart';

class CustomTab extends StatelessWidget {
  String title;
  final VoidCallback onTap;
  String image;

  CustomTab({required this.onTap, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            image,
            colorFilter: ColorFilter.mode(ColorManager.gold, BlendMode.srcIn),
          ),
          Padding(
            padding: REdgeInsets.only(top: 8),
            child: Text(title, style: Theme.of(context).textTheme.labelMedium),
          ),
        ],
      ),
    );
  }
}
