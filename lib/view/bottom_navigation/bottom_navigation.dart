import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return Consumer<BottomProvider>(
      builder: (context, value, child) => Scaffold(
        body: pages[value.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColor.primary,
          selectedItemColor: AppColor.black,
          currentIndex: value.currentIndex,
          onTap: (i) {
            bottomProvider.updateIndex(i);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_outlined),
              label: "",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: ""),
          ],
        ),
      ),
    );
  }
}

///end
