import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:shoppe/generated/assets.dart';
import 'package:shoppe/utils/colors.dart';
import 'package:shoppe/utils/textstyles.dart';
import 'package:shoppe/view/auth/forgot_password/new_password_page.dart';
import 'package:shoppe/widgets/app_button_widget.dart';
import 'package:shoppe/widgets/app_cancel_button_widget.dart';
import 'package:shoppe/widgets/app_text_widget.dart';

///start
class RecoveryCodePage extends StatefulWidget {
  const RecoveryCodePage({super.key});

  @override
  State<RecoveryCodePage> createState() => _RecoveryCodePageState();
}

class _RecoveryCodePageState extends State<RecoveryCodePage> {
  late FocusNode focusNode;
  late TextEditingController codeController;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode()..requestFocus();
    codeController = TextEditingController();
  }

  @override
  void dispose() {
    codeController.dispose();
    focusNode.dispose();
    super.dispose();
  }

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
                recoveryCodeField(),
                200.verticalSpace,
                sendAgainButton(),
                10.verticalSpace,
                cancelButtonWidget(),
                10.verticalSpace,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding sendAgainButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30).r,
      child: AppButtonWidget(text: "Send Again"),
    );
  }

  Widget subHeadingWidget() {
    return AppTextWidget(
      align: TextAlign.center,
      text: "Enter 4 digit code we sent you on your phone number or email",
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

  Widget recoveryCodeField() {
    return Pinput(
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      length: 4,
      obscuringWidget: Container(
        height: 15.r,
        width: 15.r,
        decoration: BoxDecoration(
          color: AppColor.primary,
          shape: BoxShape.circle,
        ),
      ),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Please enter code";
        } else if (value.toString().length < 4) {
          return "Please enter valid code";
        } else {
          ///
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPasswordPage()),
          );
          return null;
        }
      },
      errorPinTheme: PinTheme(
        height: 15.r,
        width: 15.r,
        decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.red),
      ),
      controller: codeController,
      obscureText: true,
      defaultPinTheme: PinTheme(
        height: 15.r,
        width: 15.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.lightGrey,
        ),
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

///end
