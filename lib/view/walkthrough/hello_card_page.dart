import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/generated/assets.dart';
import 'package:shoppe/utils/colors.dart';
import 'package:shoppe/utils/textstyles.dart';
import 'package:shoppe/widgets/app_text_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HelloCardPage extends StatefulWidget {
  const HelloCardPage({super.key});

  @override
  State<HelloCardPage> createState() => _HelloCardPageState();
}

class _HelloCardPageState extends State<HelloCardPage> {
  PageController pageController = PageController();

  ///random web images
  List<String> images = [
    Assets.imagesOne,
    Assets.imagesTwo,
    Assets.imagesThree,
    Assets.imagesFour,
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(Assets.imagesHelloBubble, fit: BoxFit.fill),
          Column(
            children: [
              100.verticalSpace,
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20).r,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.black.withValues(alpha: 0.1),
                        blurRadius: 15,
                        offset: Offset(-1, 6),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20).r,
                  ),
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: images.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ).r,
                          child: Image.asset(
                            alignment: Alignment.topCenter,
                            images[index],
                            fit: BoxFit.cover,
                            height: 320.h,
                            width: 1.sw,
                          ),
                        ),
                        20.verticalSpace,
                        headingWidget(),
                        10.verticalSpace,
                        subHeadingWidget(),
                        5.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
              30.verticalSpace,
              SmoothPageIndicator(
                effect: SlideEffect(
                  spacing: 20,
                  activeDotColor: AppColor.primary,
                  dotColor: AppColor.primary.withValues(alpha: 0.1),
                ),
                controller: pageController,
                count: images.length,
              ),
              40.verticalSpace,
            ],
          ),
        ],
      ),
    );
  }

  AppTextWidget headingWidget() {
    return AppTextWidget(
      text: "Hello",
      textStyle: AppTextStyles.largeHeading.copyWith(
        color: AppColor.black,
        fontSize: 24.spMin,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget subHeadingWidget() {
    return AppTextWidget(
      align: TextAlign.center,
      text:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.",
      textStyle: AppTextStyles.btnMediumLightHeading.copyWith(
        color: AppColor.black,
        fontSize: 18.spMin,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
