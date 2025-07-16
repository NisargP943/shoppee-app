import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/generated/assets.dart';
import 'package:shoppe/utils/colors.dart';

class AppTextStyles {
  static final largeHeading = TextStyle(
    fontSize: 52.spMin,
    fontWeight: FontWeight.w600,
  );
  static final mediumLightHeading = TextStyle(
    fontSize: 20.spMin,
    fontWeight: FontWeight.w200,
  );

  static final btnMediumLightHeading = TextStyle(
    fontSize: 22.spMin,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );

  static final large50Heading = TextStyle(
    fontSize: 50.spMin,
    fontFamily: Assets.fontsRalewayExtraBold,
    height: 1,
    fontWeight: FontWeight.w600,
  );
}
