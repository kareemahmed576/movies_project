import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';

class ScreenshotView extends StatelessWidget {
  String image;
  ScreenshotView({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 167.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
