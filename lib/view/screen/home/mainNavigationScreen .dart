import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second/controller/home/navigatorBar.dart';
import 'package:second/core/constant/app_constants.dart';
import 'package:second/view/screen/CartPage.dart';
import 'package:second/view/screen/home/HomePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:second/view/screen/services_and_stores/services_screen.dart';
import 'package:second/view/screen/setting.dart';

class MainNavigationScreen extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    HomePage(),
    ServicesScreen(),
    CartPage(),
    //AreasPage(),
    Setting(),
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
          color: AppColors.primaryPurple,
          // Colors.blue,
          buttonBackgroundColor: AppColors.primaryPurple,
          //Colors.blueAccent,
          animationDuration: Duration(milliseconds: 300),
          items: const [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.favorite, color: Colors.white),
            Icon(Icons.shopping_cart, color: Colors.white),
            Icon(Icons.settings, color: Colors.white),
          ],
          onTap: (index) {
            controller.changeIndex(index);
          },
        ),
      ),
    );
  }
}
