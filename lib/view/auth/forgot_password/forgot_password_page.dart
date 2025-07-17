import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/generated/assets.dart';
import 'package:shoppe/utils/colors.dart';
import 'package:shoppe/utils/textstyles.dart';
import 'package:shoppe/widgets/app_button_widget.dart';
import 'package:shoppe/widgets/app_text_widget.dart';
import 'package:shoppe/widgets/small_button_widget.dart';

///start region
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  int? index;
  String smsText = "Enter 4-digits code we sent you on your phone number";
  final unSelectedStyle = AppTextStyles.largeHeading.copyWith(
    color: AppColor.black,
    fontSize: 16.spMin,
    fontWeight: FontWeight.w400,
  );
  final selectedStyle = AppTextStyles.largeHeading.copyWith(
    color: AppColor.primary,
    fontSize: 16.spMin,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(Assets.imagesForgotPassword),
            StatefulBuilder(
              builder: (context, setState) => Column(
                children: [
                  120.verticalSpace,
                  Image.asset(Assets.imagesUser, height: 100.h),
                  5.verticalSpace,
                  headingWidget(),
                  5.verticalSpace,
                  subHeadingWidget(),
                  20.verticalSpace,
                  selectorWidget(),
                  140.verticalSpace,
                  appButtonWidget(),
                  20.verticalSpace,
                  cancelButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppTextWidget subHeadingWidget() {
    return AppTextWidget(
      align: TextAlign.center,
      text: index == 0
          ? smsText
          : index == 1
          ? "Password reset email has been sent on registered email"
          : "How would you like to restore password?",
      textStyle: AppTextStyles.btnMediumLightHeading.copyWith(
        color: AppColor.black,
        fontSize: 18.spMin,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  AppTextWidget headingWidget() {
    return AppTextWidget(
      text: "Password Recovery",
      textStyle: AppTextStyles.largeHeading.copyWith(
        color: AppColor.black,
        fontSize: 24.spMin,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget appButtonWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15).r,
      child: AppButtonWidget(text: "Next", onPressed: () {}),
    );
  }

  Widget selectorWidget() {
    return Column(
      children: [
        SmallButtonWidget(
          icon: Icons.check,
          checkColor: index == 0
              ? AppColor.primary
              : AppColor.checkBoxSecondary,
          onPressed: () {
            setState(() {
              index = 0;
            });
          },
          buttonText: "SMS",
          btnColor: index == 0
              ? AppColor.smallBtnPrimary
              : AppColor.smallBtnSecondary,
          style: index == 0 ? selectedStyle : unSelectedStyle,
        ),
        10.verticalSpace,
        SmallButtonWidget(
          icon: Icons.check,
          checkColor: index == 1
              ? AppColor.primary
              : AppColor.checkBoxSecondary,
          onPressed: () {
            setState(() {
              index = 1;
            });
          },
          buttonText: "Email",
          btnColor: index == 1
              ? AppColor.smallBtnPrimary
              : AppColor.smallBtnSecondary,
          style: index == 1 ? selectedStyle : unSelectedStyle,
        ),
      ],
    );
  }

  Widget cancelButtonWidget() {
    return Center(
      child: GestureDetector(
        onTap: () {},
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

///end region
