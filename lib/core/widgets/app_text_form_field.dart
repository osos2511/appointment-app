import 'package:appoinment_app/core/theming/colors.dart';
import 'package:appoinment_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding:contentPadding?? REdgeInsets.symmetric(horizontal: 20, vertical: 18),
        focusedBorder: focusedBorder?? OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.mainBlue, width: 1.3.w),
          borderRadius: BorderRadius.circular(16.r),
        ),
        enabledBorder:enabledBorder?? OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsManager.lighterGray,
            width: 1.3.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        hintStyle:hintStyle?? TextStyles.font14DarkBlueMedium,
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor:backgroundColor?? ColorsManager.moreLightGray
      ),
      style:TextStyles.font14DarkBlueMedium,
      obscureText: isObscureText??false,
      validator: (value) {
        return validator(value);
      },


    );
  }
}
