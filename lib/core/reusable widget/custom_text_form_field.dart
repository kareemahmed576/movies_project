import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_project/core/resources/assets_manager.dart';
import 'package:movies_project/core/resources/colors_manager.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final String iconPath;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.iconPath,
    required this.controller,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      style: Theme.of(context).textTheme.labelSmall,
      cursorColor: ColorsManager.white,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: ColorsManager.darkGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
        prefixIcon: UnconstrainedBox(
          child: SvgPicture.asset(
            widget.iconPath,
            width: 30.w,
            height: 30.h,
            fit: BoxFit.contain,
          ),
        ),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: UnconstrainedBox(
                  child: SvgPicture.asset(
                    obscureText
                        ? AssetsManager.eyeOffIcon
                        : AssetsManager.eyeOnIcon,
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
