import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/utils/colors.dart';

class AppTextFieldWidget extends StatelessWidget {
  AppTextFieldWidget({
    super.key,
    this.controller,
    this.textInputType,
    this.textInputAction,
    required this.hint,
    this.suffixIcon,
    this.isPasswordHide,
  });

  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool? isPasswordHide;
  final String hint;
  final Widget? suffixIcon;
  final border = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(22).r,
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPasswordHide ?? false,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      decoration: InputDecoration(
        fillColor: AppColor.lightGrey,
        hintStyle: TextStyle(color: AppColor.grey),
        hintText: hint,
        suffixIcon: suffixIcon,
        filled: true,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
      ),
    );
  }
}
