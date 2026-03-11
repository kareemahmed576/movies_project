import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/DI/di.dart';
import 'package:movies_project/core/resources/strings_manager.dart';
import 'package:movies_project/features/home%20screen/home%20tab/domain/entity/movie_available_entitiy_req.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/view%20model/section_view_model.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/widget/available_page_view.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/widget/sections_part.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide a single SectionViewModel for all sections
    return BlocProvider(
      create: (_) => getIt<SectionViewModel>(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AvailablePageView(),

            // Each section now uses the shared SectionViewModel
            SectionsPart(
              movie: MovieAvailableEntitiyReq(gense: ["Horror"]),
              title: StringsManager.Horror.tr(),
            ),
            SectionsPart(
              movie: MovieAvailableEntitiyReq(gense: ["Action"]),
              title: StringsManager.action.tr(),
            ),
            SectionsPart(
              movie: MovieAvailableEntitiyReq(gense: ["Adventure"]),
              title: StringsManager.Adventure.tr(),
            ),
            SectionsPart(
              movie: MovieAvailableEntitiyReq(gense: ["Drama"]),
              title: StringsManager.Drama .tr(),
            ),
          ],
        ),
      ),
    );
  }
}