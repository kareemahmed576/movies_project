import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/constants_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/core/reusable%20widget/custom_button.dart';
import 'package:movies_project/core/reusable%20widget/movies_gridview.dart';
import 'package:movies_project/features/movie%20details/presentation/widgets/actor_view.dart';
import 'package:movies_project/features/movie%20details/presentation/widgets/custom_container.dart';
import 'package:movies_project/features/movie%20details/presentation/widgets/genre_gridview.dart';
import 'package:movies_project/features/movie%20details/presentation/widgets/screenshot_view.dart';
import '../../../home screen/profile tab/model/movieModel.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieModel movieDetailsModel;
  const MovieDetailsScreen(this.movieDetailsModel, {super.key});

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
                        Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.2),
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
                      Text(
                        "Doctor Strange in the Multiverse of Madness",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "2022",
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
                        icon: AssetsManager.heartIcon,
                        value: "15",
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomContainer(
                        icon: AssetsManager.watchIcon,
                        value: "90",
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomContainer(
                        icon: AssetsManager.rateIcon,
                        value: "7.6",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(StringsManager.screenShots.tr()),
                ),
                SizedBox(height: 9.h),
                ScreenshotView(image: AssetsManager.screenshot1),
                SizedBox(height: 13.h),
                ScreenshotView(image: AssetsManager.screenshot2),
                SizedBox(height: 13.h),
                ScreenshotView(image: AssetsManager.screenshot3),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(StringsManager.similar.tr()),
                ),
                SizedBox(height: 16.h),
                MoviesGridview(
                  itemCount: ConstantsManager.movies.length - 13,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                  movieCardContainerWidth: 190,
                  movieCardContainerHeight: 280,
                  scrollPhysics: NeverScrollableScrollPhysics(),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(StringsManager.summary.tr()),
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(StringsManager.cast.tr()),
                ),
                SizedBox(height: 8.h),
                ActorView(
                  name: "Name : Hayley Atwell",
                  character: "Character : Captain Carter",
                  image: AssetsManager.actor1,
                ),
                SizedBox(height: 8.h),
                ActorView(
                  name: "Name : Elizabeth Olsen",
                  character: "Character : Wanda Maximoff / The Scarlet Witch",
                  image: AssetsManager.actor2,
                ),
                SizedBox(height: 8.h),
                ActorView(
                  name: "Name : Rachel McAdams",
                  character: "Character : Dr. Christine Palmer",
                  image: AssetsManager.actor3,
                ),
                SizedBox(height: 8.h),
                ActorView(
                  name: "Name : Charlize Theron",
                  character: "Character : Clea",
                  image: AssetsManager.actor4,
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(StringsManager.genres.tr()),
                ),
                SizedBox(height: 8.h),
                GenreGridview(
                  itemCount: ConstantsManager.genres.length,
                  crossAxisCount: 3,
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
