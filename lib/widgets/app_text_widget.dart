import 'package:flutter/material.dart';
import 'package:shoppe/utils/textstyles.dart';

class AppTextWidget extends StatelessWidget {
  const AppTextWidget({
    super.key,
    required this.text,
    this.textStyle,
    this.align,
  });
  final String text;
  final TextStyle? textStyle;
  final TextAlign? align;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ?? AppTextStyles.mediumLightHeading,
      textAlign: align,
    );
  }
}
