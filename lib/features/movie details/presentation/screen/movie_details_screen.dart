import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/core/reusable%20widget/custom_button.dart';
import 'package:movies_project/features/movie%20details/presentation/widgets/custom_container.dart';
import 'package:movies_project/features/movie%20details/presentation/widgets/genre_gridview.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(AssetsManager.backArrowIcon),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsManager.saveIcon),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 600.h,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    image: DecorationImage(
                      image: AssetImage(AssetsManager.onboarding5),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                        Theme.of(context).colorScheme.primary,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Center(child: Image.asset(AssetsManager.playIcon)),
                Positioned(
                  bottom: 8.h,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding: REdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Movie Title",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "2024",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CustomButton(
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  title: StringsManager.watch.tr(),
                  onClick: () {},
                  prefixIcon: null,
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomContainer(
                        icon: AssetsManager.watchIcon,
                        value: "0",
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomContainer(
                        icon: AssetsManager.rateIcon,
                        value: "0.0",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(StringsManager.summary.tr()),
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Movie summary will appear here once the data is loaded.",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(StringsManager.genres.tr()),
                ),
                SizedBox(height: 8.h),
                GenreGridview(
                  itemCount: 3,
                  crossAxisCount: 3,
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 16,
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}