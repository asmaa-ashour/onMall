import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/home/navigatorBar.dart';
import 'package:second/core/constant/color.dart';
import 'package:second/view/screen/CartPage.dart';
import 'package:second/view/screen/FavoritesPage.dart';
import 'package:second/view/screen/ProfilePage.dart';
import 'package:second/view/screen/home/HomePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:second/view/screen/home/areaScreen.dart';
import 'package:second/view/screen/test/category_screen.dart';

class MainNavigationScreen extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    HomePage(),
    FavoritesPage(),
    CartPage(),
    CategoriesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      builder: (controller) => Scaffold(
        body: pages[controller.currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          index: controller.currentIndex,
          height: 60,
          backgroundColor: Colors.transparent,
          color: AppColor.prrimaryColor,
          // Colors.blue,
          buttonBackgroundColor: AppColor.prrimaryColor,
          //Colors.blueAccent,
          animationDuration: Duration(milliseconds: 300),
          items: const [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.favorite, color: Colors.white),
            Icon(Icons.shopping_cart, color: Colors.white),
            Icon(Icons.location_on, color: Colors.white),
          ],
          onTap: (index) {
            controller.changeIndex(index);
          },
        ),
      ),
    );
  }
}
