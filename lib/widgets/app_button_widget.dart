import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/utils/colors.dart';
import 'package:shoppe/utils/textstyles.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.style,
  });

  final String text;
  final void Function()? onPressed;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(1.sw, 45.h),
        backgroundColor: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12).r,
        ),
        elevation: 2,
      ),
      onPressed: onPressed,
      child: Text(text, style: style ?? AppTextStyles.btnMediumLightHeading),
    );
  }
}
