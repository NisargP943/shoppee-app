import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoppe/generated/assets.dart';
import 'package:shoppe/utils/colors.dart';
import 'package:shoppe/view/bottom_navigation/provider/bottom_navigation_provider.dart';
import 'package:shoppe/view/home/home_page.dart';

///start
class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  List<Widget> pages = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomProvider>(context);
    return bottomNavigatorWidget(bottomProvider);
  }

  Widget bottomNavigatorWidget(BottomProvider bottomProvider) {
    return Consumer<BottomProvider>(
      builder: (context, value, child) => Scaffold(
        body: pages[value.currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: AppColor.lightGrey)),
          ),
          padding: EdgeInsets.only(bottom: 12).r,
          child: CustomLineIndicatorBottomNavbar(
            unselectedIconSize: 22,
            selectedIconSize: 22,
            indicatorType: IndicatorType.bottom,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            lineIndicatorWidth: 2.w,
            unSelectedColor: AppColor.primary,
            selectedColor: AppColor.black,
            currentIndex: value.currentIndex,
            onTap: (i) {
              bottomProvider.updateIndex(i);
            },
            customBottomBarItems: [
              CustomBottomBarItems(
                label: "",
                isAssetsImage: true,
                assetsImagePath: Assets.imagesShop,
              ),
              CustomBottomBarItems(
                label: "",
                isAssetsImage: true,
                assetsImagePath: Assets.imagesWishlist,
              ),
              CustomBottomBarItems(
                label: "",
                isAssetsImage: true,
                assetsImagePath: Assets.imagesCategories,
              ),
              CustomBottomBarItems(
                label: "",
                isAssetsImage: true,
                assetsImagePath: Assets.imagesCart,
              ),
              CustomBottomBarItems(
                label: "",
                isAssetsImage: true,
                assetsImagePath: Assets.imagesProfile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///end
