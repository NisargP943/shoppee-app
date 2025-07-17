import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/utils/colors.dart';

class SmallButtonWidget extends StatelessWidget {
  const SmallButtonWidget({
    super.key,
    required this.buttonText,
    this.onPressed,
    required this.btnColor,
    required this.style,
    required this.checkColor,
    this.icon,
  });
  final String buttonText;
  final IconData? icon;
  final TextStyle style;
  final void Function()? onPressed;
  final Color checkColor;
  final Color btnColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Spacer(),
          Text(buttonText, style: style),
          Spacer(),
          Container(
            height: 20.r,
            width: 20.r,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.white, width: 1.5),
              color: checkColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon ?? null, color: AppColor.white, size: 12),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: Size(0.5.sw, 35.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25).r,
        ),
        backgroundColor: btnColor,
      ),
    );
  }
}
