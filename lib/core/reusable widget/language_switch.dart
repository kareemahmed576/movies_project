import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/assets_manager.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 92.w,
          height: 40.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.tertiary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        SizedBox(
          width: 92.w,
          height: 40.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: Padding(
                  padding: REdgeInsets.all(4.0),
                  child: ClipOval(
                    child: Image.asset(
                      AssetsManager.usaLogo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Container(
                width: 36.w,
                height: 36.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: REdgeInsets.all(4.0),
                  child: ClipOval(
                    child: Image.asset(
                      AssetsManager.egpLogo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
