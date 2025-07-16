import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppe/generated/assets.dart';
import 'package:shoppe/utils/colors.dart';
import 'package:shoppe/utils/textstyles.dart';
import 'package:shoppe/widgets/app_button_widget.dart';
import 'package:shoppe/widgets/app_text_widget.dart';
import 'package:shoppe/widgets/app_textfield_widget.dart';

///start region
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController numberController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    numberController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(Assets.imagesBubbles),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  110.verticalSpace,
                  AppTextWidget(
                    text: "Create\nAccount",
                    textStyle: AppTextStyles.large50Heading,
                  ),
                  50.verticalSpace,
                  Image.asset(Assets.imagesUploadPhoto, height: 60.h),
                  20.verticalSpace,
                  emailFieldWidget(),
                  10.verticalSpace,
                  passwordFieldWidget(),
                  10.verticalSpace,
                  numberFieldWidget(),
                  40.verticalSpace,
                  AppButtonWidget(text: "Done", onPressed: validateInputs),
                  30.verticalSpace,
                  cancelButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emailFieldWidget() {
    return AppTextFieldWidget(
      controller: emailController,
      hint: "Email",
      textInputAction: TextInputAction.next,
      textInputType: TextInputType.emailAddress,
    );
  }

  AppTextFieldWidget passwordFieldWidget() {
    return AppTextFieldWidget(
      controller: passwordController,
      isPasswordHide: true,
      suffixIcon: Icon(Icons.remove_red_eye_outlined),
      hint: "Password",
      textInputAction: TextInputAction.next,
      textInputType: TextInputType.visiblePassword,
    );
  }

  Widget numberFieldWidget() {
    return AppTextFieldWidget(
      controller: numberController,
      hint: "Your Number",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.number,
    );
  }

  Widget cancelButtonWidget() {
    return Center(
      child: GestureDetector(
        onTap: cancelFunction,
        child: AppTextWidget(text: "Cancel"),
      ),
    );
  }

  void cancelFunction() {
    emailController.clear();
    passwordController.clear();
    numberController.clear();
    Fluttertoast.showToast(
      msg: "Process Abort",
      backgroundColor: AppColor.primary,
      textColor: AppColor.white,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void validateInputs() {
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter email",
        backgroundColor: AppColor.primary,
        textColor: AppColor.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    } else if (!emailController.text.contains("@") ||
        !emailController.text.contains(".")) {
      Fluttertoast.showToast(
        msg: "Please enter valid email",
        backgroundColor: AppColor.primary,
        textColor: AppColor.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    } else if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter password",
        backgroundColor: AppColor.primary,
        textColor: AppColor.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    } else if (passwordController.text.length < 6) {
      Fluttertoast.showToast(
        msg: "Please enter valid password",
        backgroundColor: AppColor.primary,
        textColor: AppColor.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    } else if (numberController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter number",
        backgroundColor: AppColor.primary,
        textColor: AppColor.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    } else if (numberController.text.length < 10) {
      Fluttertoast.showToast(
        msg: "Please enter valid number",
        backgroundColor: AppColor.primary,
        textColor: AppColor.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    } else {
      /// Navigate to home page
    }
  }
}

/// end region
