import 'package:flutter/material.dart';
import 'package:movies_project/core/resources/constants_manager.dart';
import 'package:movies_project/core/reusable%20widget/avatar_item.dart';

class AvatarList extends StatefulWidget {
  final Function(String) onAvatarSelected;
  const AvatarList({super.key, required this.onAvatarSelected});

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
  void initState() {
    super.initState();
    // Notify initial avatar selection
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onAvatarSelected(ConstantsManager.avatars[selectedIndex]);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      onPageChanged: (index) {
        setState(() {
          selectedIndex = index;
        });
        widget.onAvatarSelected(ConstantsManager.avatars[index]);
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
