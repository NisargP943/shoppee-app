import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shoppe/generated/assets.dart';
import 'package:shoppe/utils/colors.dart';
import 'package:shoppe/utils/textstyles.dart';
import 'package:shoppe/view/auth/provider/auth_provider.dart';
import 'package:shoppe/widgets/app_text_widget.dart';

/// start region
class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key, required this.username});

  final String username;

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  late TextEditingController passwordController;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    focusNode = FocusNode()..requestFocus();
  }

  @override
  void dispose() {
    passwordController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(Assets.imagesAuthBubble),
            Center(
              child: Column(
                children: [
                  150.verticalSpace,
                  Image.asset(Assets.imagesUser, height: 100.h),
                  15.verticalSpace,
                  AppTextWidget(
                    text: "Hello, ${widget.username}",
                    textStyle: AppTextStyles.large50Heading.copyWith(
                      fontSize: 42.spMin,
                    ),
                  ),
                  25.verticalSpace,
                  AppTextWidget(
                    text: "Type your password",
                    textStyle: AppTextStyles.btnMediumLightHeading.copyWith(
                      color: AppColor.black,
                      fontSize: 18.spMin,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  15.verticalSpace,
                  passwordFieldWidget(),
                  10.verticalSpace,
                  AppTextWidget(text: "Forgot your password ?"),
                  30.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget passwordFieldWidget() {
    return Pinput(
      focusNode: focusNode,
      keyboardType: TextInputType.text,
      length: 10,
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
          return "Please enter password";
        } else if (value.toString().length < 8) {
          return "Please enter valid password";
        } else {
          callLoginApi();
          return null;
        }
      },
      errorPinTheme: PinTheme(
        height: 15.r,
        width: 15.r,
        decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.red),
      ),
      controller: passwordController,
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

  void callLoginApi() async {
    final authRep = Provider.of<AuthProvider>(context, listen: false);
    await authRep.loginApi(widget.username, passwordController.text);
    if (authRep.loginResponseModel.username != null) {
      Fluttertoast.showToast(
        msg: "Welcome Back,${authRep.loginResponseModel.username}",
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
}

///end region
