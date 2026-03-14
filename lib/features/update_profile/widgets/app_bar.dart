import 'package:flutter/material.dart';
import 'package:movies_project/core/resources/colors_manager.dart';
import 'package:movies_project/core/resources/strings_manager.dart';

class UpdateAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UpdateAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        StringsManager.pickAvatar,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: ColorManager.gold),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
