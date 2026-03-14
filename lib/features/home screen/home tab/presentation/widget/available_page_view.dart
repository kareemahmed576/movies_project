import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/constants_manager.dart';
import 'package:movies_project/core/reusable%20widget/movie_card.dart';

import '../../../../../core/resources/colors_manager.dart';

class AvailablePageView extends StatefulWidget {
  @override
  State<AvailablePageView> createState() => _AvailablePageViewState();
}

class _AvailablePageViewState extends State<AvailablePageView> {
  int selectedIndex=0;

  PageController controller = PageController(viewportFraction: 0.7);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: 655.h,
        child: Stack(
          children: [
            Image.asset(ConstantsManager.images[selectedIndex],fit: BoxFit.cover,height: double.infinity,),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorManager.darkBlack,
                    ColorManager.darkBlack.withValues(alpha: 0.80),
                    ColorManager.darkBlack.withValues(alpha: 0.60),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AssetsManager.availableNow),
                  SizedBox(
                    height: 380.h,
                    child: PageView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding:  REdgeInsets.symmetric(horizontal: 18,vertical: selectedIndex==index?0:35.h),
                        child: MovieCard(
                          movie: ConstantsManager.movies[index],
                          containerWidth: 234,
                          containerHeight: 351,
                        ),
                      ),
                      itemCount: 6,
                      controller: controller,
                      onPageChanged: (value) {
                        setState(() {
                          selectedIndex=value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 21.h,),
                  Padding(
                    padding:  REdgeInsets.symmetric(horizontal: 38),
                    child: Image.asset(AssetsManager.watchNow),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
