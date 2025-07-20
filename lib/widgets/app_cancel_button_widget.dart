import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/utils/textstyles.dart';
import 'package:shoppe/widgets/app_text_widget.dart';

class AppCancelButton extends StatelessWidget {
  const AppCancelButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: AppTextWidget(
          text: "Cancel",
          textStyle: AppTextStyles.mediumLightHeading.copyWith(
            fontSize: 16.spMin,
          ),
        ),
      ),
    );
  }
}
