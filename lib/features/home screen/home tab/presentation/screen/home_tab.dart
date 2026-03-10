import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies_project/features/home%20screen/home%20tab/presentation/widget/available_page_view.dart';
import 'package:movies_project/features/home%20screen/home%20tab/presentation/widget/sections_part.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AvailablePageView(),
          SectionsPart(title: "Action",),
          SectionsPart(title: "Horror",),
          SectionsPart(title: "Adventure",),
        ],
      ),
    );
  }
}
