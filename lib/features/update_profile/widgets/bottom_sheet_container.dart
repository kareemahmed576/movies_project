import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/colors_manager.dart';
import '../manager/selected_avatar_cubit.dart';
import 'bottom_sheet_item.dart';

class BottomSheetContainer extends StatefulWidget {
  const BottomSheetContainer({super.key});

  @override
  State<BottomSheetContainer> createState() => _BottomSheetContainerState();
}

class _BottomSheetContainerState extends State<BottomSheetContainer> {
  int selectedIndex = -1;

  final List<String> avatars = [
    AssetsManager.avatar1,
    AssetsManager.avatar2,
    AssetsManager.avatar3,
    AssetsManager.avatar4,
    AssetsManager.avatar5,
    AssetsManager.avatar6,
    AssetsManager.avatar7,
    AssetsManager.avatar8,
    AssetsManager.avatar9,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedAvatarCubit, String>(
        builder: (context, state) {
          return Container(
            child: Padding(
              padding: REdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorManager.darkGray,
                  borderRadius: BorderRadius.all(Radius.circular(24.r)),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: avatars.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                  ),
                  itemBuilder: (context, index) {
                    bool isSelected = state == avatars[index];

                    return GestureDetector(
                      onTap: () {
                          context.read<SelectedAvatarCubit>().selectAvatar(avatars[index]);
                      },
                      child: BottomSheetItem(
                        isSelected: isSelected,
                        index: index + 1,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
        );
  }
}
