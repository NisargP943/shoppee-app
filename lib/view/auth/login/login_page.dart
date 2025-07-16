import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppe/generated/assets.dart';
import 'package:shoppe/utils/colors.dart';
import 'package:shoppe/utils/textstyles.dart';
import 'package:shoppe/view/auth/password/password_page.dart';
import 'package:shoppe/widgets/app_button_widget.dart';
import 'package:shoppe/widgets/app_text_widget.dart';
import 'package:shoppe/widgets/app_textfield_widget.dart';

///start region
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(Assets.imagesLoginBubbles),
            Column(
              children: [
                250.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      100.verticalSpace,
                      AppTextWidget(
                        text: "Login",
                        textStyle: AppTextStyles.large50Heading,
                      ),
                      10.verticalSpace,
                      AppTextWidget(text: "Good to see you back!"),
                      10.verticalSpace,
                      emailFieldWidget(),
                      30.verticalSpace,
                      AppButtonWidget(text: "Next", onPressed: validateInputs),
                      30.verticalSpace,
                      cancelButtonWidget(),
                      30.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget emailFieldWidget() {
    return AppTextFieldWidget(
      controller: emailController,
      hint: "Username",
      textInputAction: TextInputAction.next,
      textInputType: TextInputType.emailAddress,
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
    Fluttertoast.showToast(
      msg: "Process Abort",
      backgroundColor: AppColor.primary,
      textColor: AppColor.white,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void validateInputs() async {
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter username",
        backgroundColor: AppColor.primary,
        textColor: AppColor.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    } else {
      ///navigate to password page
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PasswordPage(username: emailController.text),
        ),
      );
    }
  }
}

/// end region
