import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenreView extends StatelessWidget {
  String title;
  GenreView({required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        padding: REdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
