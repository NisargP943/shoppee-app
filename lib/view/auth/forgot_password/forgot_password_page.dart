import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppe/generated/assets.dart';
import 'package:shoppe/utils/colors.dart';
import 'package:shoppe/utils/textstyles.dart';
import 'package:shoppe/view/auth/forgot_password/recovery_code_page.dart';
import 'package:shoppe/widgets/app_button_widget.dart';
import 'package:shoppe/widgets/app_cancel_button_widget.dart';
import 'package:shoppe/widgets/app_text_widget.dart';
import 'package:shoppe/widgets/small_button_widget.dart';

///start region
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  ValueNotifier<int> index = ValueNotifier(0);
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
            Column(
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
          ],
        ),
      ),
    );
  }

  Widget subHeadingWidget() {
    return ValueListenableBuilder(
      valueListenable: index,
      builder: (context, value, child) => AppTextWidget(
        align: TextAlign.center,
        text: value == 0
            ? smsText
            : value == 1
            ? "Password reset email has been sent on registered email"
            : "How would you like to restore password?",
        textStyle: AppTextStyles.btnMediumLightHeading.copyWith(
          color: AppColor.black,
          fontSize: 18.spMin,
          fontWeight: FontWeight.w300,
        ),
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
      child: AppButtonWidget(
        text: "Next",
        onPressed: () {
          ///navigate to recovery code or new password page
          index.value != 0
              ? Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecoveryCodePage()),
                )
              : Fluttertoast.showToast(
                  msg: "Please any one from above",
                  toastLength: Toast.LENGTH_SHORT,
                );
        },
      ),
    );
  }

  Widget selectorWidget() {
    return ValueListenableBuilder(
      valueListenable: index,
      builder: (context, value, child) => Column(
        children: [
          SmallButtonWidget(
            icon: Icons.check,
            checkColor: value == 0
                ? AppColor.primary
                : AppColor.checkBoxSecondary,
            onPressed: () {
              index.value = 0;
            },
            buttonText: "SMS",
            btnColor: value == 0
                ? AppColor.smallBtnPrimary
                : AppColor.smallBtnSecondary,
            style: index == 0 ? selectedStyle : unSelectedStyle,
          ),
          10.verticalSpace,
          SmallButtonWidget(
            icon: Icons.check,
            checkColor: value == 1
                ? AppColor.primary
                : AppColor.checkBoxSecondary,
            onPressed: () {
              index.value = 1;
            },
            buttonText: "Email",
            btnColor: value == 1
                ? AppColor.smallBtnPrimary
                : AppColor.smallBtnSecondary,
            style: value == 1 ? selectedStyle : unSelectedStyle,
          ),
        ],
      ),
    );
  }

  Widget cancelButtonWidget() {
    return AppCancelButton(
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}

///end region
