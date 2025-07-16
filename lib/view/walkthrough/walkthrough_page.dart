import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/generated/assets.dart';
import 'package:shoppe/utils/textstyles.dart';
import 'package:shoppe/view/auth/login/login_page.dart';
import 'package:shoppe/view/auth/sign_up_page.dart';
import 'package:shoppe/widgets/app_button_widget.dart';
import 'package:shoppe/widgets/app_text_widget.dart';

/// start region
class WalkthroughPage extends StatefulWidget {
  const WalkthroughPage({super.key});

  @override
  State<WalkthroughPage> createState() => _WalkthroughPageState();
}

class _WalkthroughPageState extends State<WalkthroughPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset(Assets.imagesShoppeLogo, height: 110.h),
              10.verticalSpace,
              appNameWidget(),
              5.verticalSpace,
              appSubTextWidget(),
              100.verticalSpace,
              AppButtonWidget(
                text: "Let's Get Started",
                onPressed: navigateToSignUp,
              ),
              20.verticalSpace,
              alreadyHaveAccWidget(),
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget appSubTextWidget() {
    return AppTextWidget(
      text: "Beautiful eCommerce UI Kit for your online store",
      align: TextAlign.center,
      textStyle: AppTextStyles.mediumLightHeading,
    );
  }

  Widget appNameWidget() {
    return AppTextWidget(text: "Shoppe", textStyle: AppTextStyles.largeHeading);
  }

  Widget alreadyHaveAccWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "I already have an account",
            style: AppTextStyles.mediumLightHeading,
          ),
          10.horizontalSpace,
          Image.asset(Assets.imagesButton, height: 22.h),
        ],
      ),
    );
  }

  void navigateToSignUp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }
}

/// end region
