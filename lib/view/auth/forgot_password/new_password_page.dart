import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppe/generated/assets.dart';
import 'package:shoppe/utils/colors.dart';
import 'package:shoppe/utils/textstyles.dart';
import 'package:shoppe/view/walkthrough/hello_card_page.dart';
import 'package:shoppe/widgets/app_button_widget.dart';
import 'package:shoppe/widgets/app_cancel_button_widget.dart';
import 'package:shoppe/widgets/app_text_widget.dart';
import 'package:shoppe/widgets/app_textfield_widget.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  late TextEditingController passwordController;
  late TextEditingController passwordRController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    passwordRController = TextEditingController();
  }

  @override
  void dispose() {
    passwordRController.dispose();
    passwordController.dispose();
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
                40.verticalSpace,
                newPasswordField(),
                10.verticalSpace,
                repeatPasswordField(),
                120.verticalSpace,
                saveButton(),
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

  Widget repeatPasswordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15).r,
      child: AppTextFieldWidget(
        hint: "Repeat Password",
        controller: passwordRController,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
      ),
    );
  }

  Widget newPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15).r,
      child: AppTextFieldWidget(
        hint: "New Password",
        controller: passwordController,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.visiblePassword,
      ),
    );
  }

  Padding saveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30).r,
      child: AppButtonWidget(text: "Save", onPressed: validateInputs),
    );
  }

  Widget subHeadingWidget() {
    return AppTextWidget(
      align: TextAlign.center,
      text: "Please, setup a new password for your account",
      textStyle: AppTextStyles.btnMediumLightHeading.copyWith(
        color: AppColor.black,
        fontSize: 18.spMin,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  AppTextWidget headingWidget() {
    return AppTextWidget(
      text: "Setup New Password",
      textStyle: AppTextStyles.largeHeading.copyWith(
        color: AppColor.black,
        fontSize: 24.spMin,
        fontWeight: FontWeight.w600,
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

  void validateInputs() {
    if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter new password",
        backgroundColor: AppColor.primary,
        textColor: AppColor.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    } else if (passwordRController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter repeat password",
        backgroundColor: AppColor.primary,
        textColor: AppColor.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    } else if (passwordController.text != passwordRController.text) {
      Fluttertoast.showToast(
        msg: "Repeat password not matched",
        backgroundColor: AppColor.primary,
        textColor: AppColor.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    } else {
      /// Navigate to home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HelloCardPage()),
      );
    }
  }
}
