import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarItem extends StatelessWidget {
  final String avatarImagePath;
  final int index;
  final int selectedIndex;

  const AvatarItem({
    super.key,
    required this.avatarImagePath,
    required this.index,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;

    return AnimatedScale(
      scale: isSelected ? 1.2 : 0.6,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Image.asset(
        avatarImagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}