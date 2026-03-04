import 'package:flutter/material.dart';
import 'package:movies_project/core/resources/constants_manager.dart';
import 'package:movies_project/core/reusable%20widget/avatar_item.dart';

import '../../../../../core/resources/color_manager.dart';

class AvatarList extends StatefulWidget {
  const AvatarList({super.key});

  @override
  State<AvatarList> createState() => _AvatarListState();
}

class _AvatarListState extends State<AvatarList> {
  PageController controller = PageController(
    initialPage: 1,
    viewportFraction: 0.39,
  );
  int selectedIndex = 1;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return PageView.builder(
      controller: controller,
      onPageChanged: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => AvatarItem(
        avatarImagePath: ConstantsManager.avatars[index],
        index: index,
        selectedIndex: selectedIndex,
      ),
      itemCount: ConstantsManager.avatars.length,
    );
  }
}
