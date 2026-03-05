import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/constants_manager.dart';

class CustomTab extends StatelessWidget {
  int index;
  CustomTab({required this.index});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Theme.of(context).colorScheme.tertiary,
            width: 2,
          ),
        ),
        padding: REdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Text(ConstantsManager.genres[index]),
      ),
    );
  }
}
